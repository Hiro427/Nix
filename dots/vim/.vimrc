let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-fuzzbox/fuzzbox.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rose-pine/vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
call plug#end()

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
set background=dark

colorscheme retrobox

let g:coc_global_extensions = [ 'coc-json', 'coc-git',  'coc-java',  'coc-go', 'coc-rust-analyzer', 'coc-sh', 'coc-sql', 'coc-html', 'coc-lua', 'coc-nix', 'coc-tailwindcss', 'coc-zig', 'coc-clangd' ]

let g:sneak#label = 1


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

nnoremap <silent> <leader><leader> :FuzzyFiles<CR>
nnoremap <silent> <leader>g :FuzzyInBuffer<CR>
nnoremap <silent> <leader>G :FuzzyGrep<CR>
nnoremap <silent> <leader>m :FuzzyMarks<CR>
nnoremap <silent> <leader>c :FuzzyCommands<CR>
nnoremap <silent> <leader>C :FuzzyColors<CR>

