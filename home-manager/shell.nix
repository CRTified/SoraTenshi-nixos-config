# Used for the configuration of specific configurations

{ config, pkgs, ... }:

{
  # Enable the usage of home-manager
  # The point of home-manager is to create
  # symlinks from /nix/store
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Terminal Emulator
    alacritty
    
    # Actual Shell, with some skins
    zsh

    # Shell utils
    bat htop
  ];

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    # enableSyntaxHighlighting = true;

    # this needs some work, the colourscheme fits, but i dislike the design
    initExtra = ''
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    shellGlobalAliases = {
      vim = "nvim ";
      sudo = "sudo ";
      cat = "bat ";
      mv = "mv -i ";
    };

    shellAliases = {
      vim = "nvim ";
      sudo = "sudo ";
      cat = "bat ";
      mv = "mv -i ";
    };

    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" "sudo" "man" "rust"
      ];
    };
  };

  home.file = {
    ".p10k.zsh" = {
      source = let
        repo = pkgs.fetchFromGitHub {
          owner  =  "s0la1337";
          repo   =  "dotfiles";
          rev    =  "81dfe16c977ed296b8466e7e528281ff33aaa464";
          sha256 =  "145538jm473ygm5paxmikzs1z98qj4lswm6iild8cpv0w31lk55h";
        };
      in "${repo}/powerlevel10k/.p10k.zsh";
    };
  };
}
