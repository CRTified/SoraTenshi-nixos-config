{ config, pkgs, nixpkgs, lib, ... }:
{
  home.sessionVariables = {
    "BROWSER" = "firefox";
  };

  home.packages = with pkgs; [
    discord steam
    discord-canary
    discord-ptb

    qmk

    freshfetch
    
    # memos
    obsidian

    # browser
    vivaldi 
    firefox

    # Screenshots!
    flameshot

    # Pic editing
    # gimp
    peek
    
    # Flashcards
    anki-bin
  ];

  xsession.initExtra = ''
    ${lib.concatMapStrings (s: s + " & \n") "flameshot"}
  '';
}
