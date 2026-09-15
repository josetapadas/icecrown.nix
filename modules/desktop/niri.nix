{ pkgs, ... }:

{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    foot
    fuzzel
    waybar
    swaybg
    swayidle
    swaylock
    wl-clipboard
    grim
    slurp
    alacritty
    fuzzel
  ];
}
