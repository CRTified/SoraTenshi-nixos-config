{ pkgs, ... }:
{
  home.packages = with pkgs; [
    go pythonFull nim

    # Language servers (for non-main languages)
    gopls rnix-lsp
  ];
}
