{ self, config, pkgs, neovim-nightly, codeium, ... }:

let 
  codeium-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "codeium";
    version = "master";
    src = codeium;
  };
in
{
  nixpkgs.overlays = neovim-nightly;

  programs.neovim = {
    enable        = true;
    vimAlias      = true;
    viAlias       = true;
    vimdiffAlias  = true;

    plugins = with pkgs.vimPlugins; [
      # utilities
      telescope-nvim vim-easy-align vim-css-color which-key-nvim vim-cursorword

      # visual 
      lualine-nvim lualine-lsp-progress

      # buffer stuff
      bufferline-nvim

      # auto complete
      nvim-lspconfig lsp_signature-nvim cmp_luasnip luasnip cmp-nvim-lsp nvim-cmp lspkind-nvim
      auto-pairs

      # design stuff
      tokyonight-nvim indent-blankline-nvim fidget-nvim

      # Toy
      guess-indent-nvim codeium-vim
      
      # tree sitter
      (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars)) nvim-ts-rainbow
    ];
  };

  xdg.configFile."nvim" = {
    source = "${self}/nvim";
    recursive = true;
  };
}
