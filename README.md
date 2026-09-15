# icecrown NixOS Configuration

Personal NixOS configuration for my icecrown laptop, managed as a flake.

## Usage

Build and switch to this configuration:

```bash
sudo nixos-rebuild switch --flake ~/src/nixos-config#icecrown
```

To build without switching:

```bash
nixos-rebuild build --flake ~/src/nixos-config#icecrown
```

Update flake inputs, inspect the changes, and apply the new lock file when ready:

```bash
nix flake update
nix flake check
sudo nixos-rebuild switch --flake ~/src/nixos-config#icecrown
```
