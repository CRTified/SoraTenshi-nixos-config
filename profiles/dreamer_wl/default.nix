{ config, pkgs, ... }:

{
  imports = [
    # User applications
    ../../applications/alacritty.nix
    ../../applications/user_apps.nix
    ../../applications/wayland/river.nix

    # General purpose
    ../../general_purpose/nvim.nix
    ../../general_purpose/zsh.nix
    ../../general_purpose/misc.nix

    # development
    ../../development/developing.nix
  ];
}
