{ config, lib, pkgs, ...}:
with lib;
let
  cfg = config.remoteapps;

  connectRdp = name: app:
  let
    passwordSrc = if cfg.passwordFile == null then "echo ${toString cfg.password}" else "cat ${cfg.passwordFile}";
    multiFlag = if cfg.multiMon then "/multimon" else "+span";
  in
  pkgs.writeShellScriptBin "startremoteapp-${name}.sh"
  ''
    ${passwordSrc} | \
    ${pkgs.freerdp3}/bin/xfreerdp \
      ${toString cfg.extraFlags} \
      /d:"${toString cfg.domain}" \
      /u:"${cfg.user}" \
      /from-stdin \
      /v:"${cfg.host}:${toString cfg.port}" \
      /cert:tofu \
      /auto-reconnect \
      /clipboard \
      +home-drive \
      -wallpaper \
      /scale:${toString cfg.scale} \
      ${multiFlag} \
      /dynamic-resolution \
      /wm-class:"${app.fullName}" \
      ${if cfg.sharePrinters then "/printer" else ""} \
      /shell:rdpinit.exe \
      /app:program:"${app.winExecutable}",icon:"${app.icon}",cmd:"$@"
  '';


  applicationOpts = { name, config, ...}: {
    options = {
      enable = mkEnableOption "Wether to enable the application";
      fullName = mkOption {
        type = types.str;
        description = "Full Name of the application";
      };
      winExecutable = mkOption {
        type = types.str;
        description = "Path to the windows executable";
      };
      categories = mkOption {
        description = "Categories in which the entry should be shown in a menu.";
        type = with types; listOf str;
        default = [];
      };
      mimeTypes = mkOption {
        description = "The MIME type(s) supported by this application.";
        type = with types; listOf str;
        default = [];
      };
      icon = mkOption {
        description = "Icon to display in file manager, menus, etc.";
        type = with types; nullOr (either str path);
        default = null;
      };
    };
  };
in
{
  imports = [ ./apps ];
  options = {
    remoteapps = {
      domain  = mkOption {
        type = with types; nullOr str;
        default = null;
      };
      host  = mkOption {
        type = with types; str;
      };
      port = mkOption {
        type = with types; port;
        default = 3389;
      };
      user = mkOption {
        type = with types; str;
      };
      password = mkOption {
        type = with types; nullOr str;
        default = null;
      };
      passwordFile = mkOption {
        type = with types; nullOr path;
        default = null;
      };
      extraFlags = mkOption {
        type = with types; nullOr str;
        default = null;
      };
      multiMon = mkOption {
        type = with types; bool;
        default = false;
      };
      scale = mkOption {
        type = with types; int;
        default = 100;
      };
      sharePrinters = mkOption {
        type = with types; bool;
        default = false;
      };
      apps = mkOption {
        type = with types; attrsOf (submodule applicationOpts);
        default = {};
      };
    };
  };

  config = {
    xdg.desktopEntries = mapAttrs
      (name: value: {
        name = value.fullName;
        icon = value.icon;
        exec = "${toString (connectRdp name value)}/bin/startremoteapp-${name}.sh %U";
        terminal = false;
        categories = value.categories;
        mimeType = value.mimeTypes;
      })
      (lib.attrsets.filterAttrs (name: value: value.enable) cfg.apps);

    home.packages = attrsets.mapAttrsToList
      (name: value: connectRdp name value)
      (lib.attrsets.filterAttrs (name: value: value.enable) cfg.apps);
  };
}
