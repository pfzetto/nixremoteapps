{
    description = "NixOS and Home-Manager modules for RemoteApps";

    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs";
    };

    outputs = { nixpkgs, ...}:
    {
      homeManagerModules.default = import ./module.nix;
    };
}
