colorscheme molokai
filetype plugin indent on
set background=dark
set nocompatible
set softtabstop=2
set tabstop=2
set backspace=indent,eol,start
set expandtab
set shiftwidth=2
set showmatch
set mouse=a
set ruler
set showcmd
set smartcase
set statusline+=%f
set ls=2
set number
set linebreak
set formatoptions+=r
set wildmenu
set wildmode=list:longest
set wildignorecase
set guicursor=i:block
syntax enable
if has('mouse_sgr')
  set ttymouse=sgr
elseif !has('nvim')
  set ttymouse=xterm2
end

" Setup the Plugins
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wsdjeg/vim-fetch'
Plug 'dense-analysis/ale'

" Certain plugins are neovim only
if has('nvim')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
end

" All Plugins must be declared before this line
call plug#end()

" tmux setting
if !empty($TMUX)
  set t_Co=256
  if !has('nvim')
    set term=screen-256color
  end
endif

let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybridline'

set cursorline
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

highlight link jsGlobalObjects Special
highlight link jsTemplateBraces Special
highlight link jsGlobalNodeObjects Keyword

" Press tab to auto-complete
let g:SuperTabDefaultCompletionType = '<c-n>'

" :WS to write file as root
command WS :execute ':silent w !sudo tee % > /dev/null' | :edit!
" \ef - autofix entire buffer with eslint_d:
nnoremap <leader>ef mF:%!eslint_d --stdin --fix-to-stdout<CR>`F
" \ff - open Telescope find files
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Declare what linters to use with which languages
let g:ale_linters_explicit = 1
let b:ale_linters = {
\ 'javascript': ['eslint'],
\}

