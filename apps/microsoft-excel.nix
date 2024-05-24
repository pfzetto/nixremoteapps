{ ... }: {
  remoteapps.apps.microsoft-excel = {
    fullName = "Microsoft Excel";
    winExecutable = "EXCEL.EXE";
    categories = [ "X-RemoteApps" "Office" ];
    mimeTypes = [
      "application/vnd.ms-excel"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.template"
      "application/vnd.ms-excel.sheet.macroEnabled.12"
      "application/vnd.ms-excel.template.macroEnabled.12"
      "application/vnd.ms-excel.addin.macroEnabled.12"
      "application/vnd.ms-excel.sheet.binary.macroEnabled.12"
    ];
    icon = builtins.fetchurl {
      url = "https://github.com/vscode-icons/vscode-icons/raw/master/icons/file_type_excel.svg";
      sha256 = "1h76wapf7yrzajvvnichq2ca8zz9sqbwygmg640950wgy82mf5ns";
    };
  };
}
