{ ... }: {
  remoteapps.apps.microsoft-publisher = {
    fullName = "Microsoft Publisher";
    winExecutable = "MSPUB.EXE";
    categories = [ "X-RemoteApps" "Office" ];
    mimeTypes = [ "application/vnd.ms-publisher" ];
    icon = builtins.fetchurl {
      url = "https://github.com/vscode-icons/vscode-icons/raw/master/icons/file_type_publisher.svg";
      sha256 = "0gb5kk0akc8p38rjqqww0sasi6xwcjjvfrwr8hahvnp46h309y5f";
    };
  };
}
