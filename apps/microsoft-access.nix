{ ... }: {
  remoteapps.apps.microsoft-access = {
    fullName = "Microsoft Access";
    winExecutable = "MSACCESS.EXE";
    categories = [ "X-RemoteApps" "Office" ];
    mimeTypes = [ "application/x-msaccess" ];
    icon = builtins.fetchurl {
      url = "https://github.com/vscode-icons/vscode-icons/raw/master/icons/file_type_access.svg";
      sha256 = "0gn4snny9dm7388zmn67gpn2zjw51zm6y7di618kb1ylbcbqbmrh";
    };
  };
}
