{ ... }: {
  remoteapps.apps.microsoft-onenote = {
    fullName = "Microsoft OneNote";
    winExecutable = "ONENOTE.EXE";
    categories = [ "X-RemoteApps" "Office" ];
    mimeTypes = [ "application/msonenote" ];
    icon = builtins.fetchurl {
      url = "https://github.com/vscode-icons/vscode-icons/raw/master/icons/file_type_onenote.svg";
      sha256 = "16v9kkw6y9ygc7vav3dvdfaq9rk1d09j86p9nd6996dpd5m8662n";
    };
  };
}
