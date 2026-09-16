{
  description = "Configuração NixOS do framework13 do znEt";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      noctalia,
      ...
    }:
    {
      nixosConfigurations.icecrown = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          nixos-hardware.nixosModules.framework-13th-gen-intel
          home-manager.nixosModules.home-manager
          ./configuration.nix

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };

            home-manager.sharedModules = [
              inputs.nixvim.homeModules.nixvim
            ];

            home-manager.users.jose = import ./home/jose.nix;
          }
        ];
      };
    };
}
