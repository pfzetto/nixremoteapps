{ ... }: {
  remoteapps.apps.microsoft-outlook = {
    fullName = "Microsoft Outlook";
    winExecutable = "OUTLOOK.EXE";
    categories = [ "X-RemoteApps" "Office" ];
    mimeTypes = [
      "application/vnd.ms-outlook"
      "application/octet-stream"
    ];
    icon = builtins.fetchurl {
      url = "https://github.com/vscode-icons/vscode-icons/raw/master/icons/file_type_outlook.svg";
      sha256 = "004063i4902jnnwh2x6wajifd7wviljacdgnx5fnrschmla3p8zj";
    };
  };
}
