{ config, pkgs, ... }: {
  programs.vim = {
    enable = true;
    extraConfig = ''
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
      set expandtab
      set backspace=indent,eol,start
      set hlsearch
      set signcolumn=no 
      set splitbelow
      set number
      set relativenumber
      set termguicolors 
      set encoding=UTF-8
      set t_RV=
      set ttymouse=xterm2
      set laststatus=2
      set noshowmode
      set noswapfile
      set re=0
      set guicursor=n-v-c:block,i-ci:ver25,r-cr:hor20,o:hor50
      set encoding=utf-8
      let &t_SI = "\e[6 q" 
      let &t_SR = "\e[4 q" 
      let &t_EI = "\e[2 q"
      let mapleader = "\<Space>"
      let &t_ut=""


    '';

    plugins = with pkgs.vimPlugins; [
      vim-sneak
      vim-commentary
      vim-surround
      zig-vim
      ctrlp-vim
      nerdtree
      vim-devicons
      fzf-vim
      vim-go
      vim-lsp-settings
      vim-lsp
      # ale
      vim-polyglot
      asyncomplete-lsp-vim
      # asyncomplete-vim

    ];

  };
}
