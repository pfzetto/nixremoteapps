{ ... }: {
  remoteapps.apps.microsoft-powerpoint = {
    fullName = "Microsoft Powerpoint";
    winExecutable = "POWERPNT.EXE";
    categories = [ "X-RemoteApps" "Office" ];
    mimeTypes = [
      "application/vnd.ms-powerpoint"
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      "application/vnd.openxmlformats-officedocument.presentationml.template"
      "application/vnd.openxmlformats-officedocument.presentationml.slideshow"
      "application/vnd.ms-powerpoint.addin.macroEnabled.12"
      "application/vnd.ms-powerpoint.presentation.macroEnabled.12"
      "application/vnd.ms-powerpoint.template.macroEnabled.12"
      "application/vnd.ms-powerpoint.slideshow.macroEnabled.12"
    ];
    icon = builtins.fetchurl {
      url = "https://github.com/vscode-icons/vscode-icons/raw/master/icons/file_type_powerpoint.svg";
      sha256 = "1za7ng4lp9vwcaq48z6pidv74amm7851gakxv7zi55cxvvb2qqkp";
    };
  };
}
