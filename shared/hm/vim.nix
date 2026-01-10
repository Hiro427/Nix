{ config, pkgs, ... }:
let
  fuzzbox = pkgs.vimUtils.buildVimPlugin {
    name = "vim-fuzzbox";
    src = pkgs.fetchFromGitHub {
      owner = "vim-fuzzbox";
      repo = "fuzzbox.vim";
      rev = "6345ff5a3b0770271315a8809d6bfbad34c0b851";
      hash = "sha256-5zJ5uHOPZCCZYbcs9AaAKJugUwRkGWlVBUGVkGoxss0=";
    };
  };
in {

  programs.vim = {
    enable = true;
    extraConfig = ''
      set tabstop=4
      set softtabstop=4
      set expandtab
      set backspace=indent,eol,start
      set shiftwidth=4
      set hlsearch
      set signcolumn=yes 
      set splitbelow
      set number 
      set relativenumber 
      set termguicolors 
      set encoding=UTF-8
      set t_RV=
      set ttymouse=xterm2
      set noswapfile
      set re=0
      set guicursor=n-v-c:block,i-ci:ver25,r-cr:hor20,o:hor50
      set encoding=utf-8
      let &t_SI = "\e[6 q" 
      let &t_SR = "\e[4 q" 
      let &t_EI = "\e[2 q"
      set fillchars+=eob:\ 
      let mapleader = " "
      let maplocalleader = "\\"
      let &t_ut=""
      set laststatus=0
      set noshowmode 
      set noru

      let g:sneak#label = 1
      let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

      let g:ycm_auto_trigger = 1
      let g:ycm_global_ycm_extra_conf = expand('~/.ycm_extra_conf.py')
      let g:ycm_confirm_extra_conf = 0
      let g:python_highlight_space_errors = 0


      let g:go_highlight_types = 1
      let g:go_highlight_fields = 1
      let g:go_highlight_functions = 1
      let g:go_highlight_methods = 1
      let g:go_highlight_structs = 1
      let g:go_highlight_operators = 1
      let g:go_highlight_build_constraints = 1
      let g:go_highlight_extra_types = 1    
      let g:go_highlight_generate_tags = 1   
      let g:go_highlight_variable_declarations = 1 
      let g:go_highlight_variable_assignments = 1
      let g:go_highlight_function_calls = 1   

      let g:fuzzbox_mappings = 0

      map f <Plug>Sneak_f
      map F <Plug>Sneak_F
      map t <Plug>Sneak_t
      map T <Plug>Sneak_T

      nmap <CR> <Plug>(easymotion-w)

      nnoremap <silent><Leader>e :NERDTreeToggle<CR>
      nnoremap <silent> <leader><leader> :FuzzyFiles<CR>

      nnoremap <silent> <leader>wl <C-w>l<CR>
      nnoremap <silent> <leader>wh <C-w>h<CR>
      nnoremap <silent> <leader>wj <C-w>j<CR>
      nnoremap <silent> <leader>wk <C-w>k<CR>

      nnoremap <silent> <leader>vs :vsplit<CR>
      nnoremap <silent> <leader>hs :split<CR>

      nnoremap <silent> <leader>j :w<CR> :bnext<CR>
      nnoremap <silent> <leader>k :w<CR> :bprev<CR>

      nnoremap <silent> <leader>hi :resize +15<CR>
      nnoremap <silent> <leader>hd :resize -15<CR>

      nnoremap <silent> <leader>vi :vertical resize +15 <CR>
      nnoremap <silent> <leader>vd :vertical resize -15<CR>
    '';

    plugins = with pkgs.vimPlugins; [
      vim-sneak
      vim-commentary
      vim-surround
      zig-vim
      rust-vim
      vim-go
      nerdtree
      vim-devicons
      vim-polyglot
      auto-pairs
      YouCompleteMe
      vim-easymotion
      fuzzbox
      vim-gitgutter
    ];

  };
}
