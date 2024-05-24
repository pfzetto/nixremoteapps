{ ... }: {
  remoteapps.apps.microsoft-word = {
    fullName = "Microsoft Word";
    winExecutable = "WINWORD.EXE";
    categories = [ "X-RemoteApps" "Office" ];
    mimeTypes = [
      "application/msword"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.template"
      "application/vnd.ms-word.document.macroEnabled.12""application/vnd.ms-word.template.macroEnabled.12"
    ];
    icon = builtins.fetchurl {
      url = "https://github.com/vscode-icons/vscode-icons/raw/master/icons/file_type_word.svg";
      sha256 = "0wzy38wkwz2vk4vwg5hw5wrybd139l7s679rz1bp31s6156pa87p";
    };
  };
}
