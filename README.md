A NixOS Home-Manager Module that works similarly to [Winapps](https://github.com/Fmstrat/winapps).

# Usage
1. Import the module.
2. Use the `remoteapps`-key to configure the module.
3. Desktop Entries and `startremoteapp-<name>.sh`-scripts will be available ofter rebuild

# Configuration
See [`module.nix`](./module.nix).

# Supported Applications
- [Microsoft Access](./apps/microsoft-access.nix)
- [Microsoft Excel](./apps/microsoft-excel.nix)
- [Microsoft OneNote](./apps/microsoft-onenote.nix)
- [Microsoft Outlook](./apps/microsoft-outlook.nix)
- [Microsoft Powerpoint](./apps/microsoft-powerpoint.nix)
- [Microsoft Publisher](./apps/microsoft-publisher.nix)
- [Microsoft Word](./apps/microsoft-word.nix)

# Adding Support
You can easily add applications by adding a `remoteapps.apps.<name>`-entry.
Take a look at the [`./apps`](./apps) for examples.

# Contributing
I'm happy about any contribution in any form.
Feel free to submit feature requests and bug reports using a GitHub Issue.
PR's are also appreciated.

# License
The code is licensed under the [MIT-License](./LICENSE.md).

Icons are fetched from [vscode-icons](https://github.com/vscode-icons/vscode-icons).
Refer to the specified licenses there for the icons.
