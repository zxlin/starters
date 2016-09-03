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
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end
syntax enable

set ruler
set showcmd

set smartcase

set statusline+=%f
set ls=2
set number

set linebreak

execute pathogen#infect()

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic local linter support
let g:syntastic_javascript_checkers = []

function CheckJavaScriptLinter(filepath, linter)
  if exists('b:syntastic_checkers')
    return
  endif
  if filereadable(a:filepath)
    let b:syntastic_checkers = [a:linter]
    let {'b:syntastic_' . a:linter . '_exec'} = a:filepath
  endif
endfunction

function SetupJavaScriptLinter()
  let l:current_folder = expand('%:p:h')
  let l:bin_folder = fnamemodify(syntastic#util#findFileInParent('package.json', l:current_folder), ':h')
  let l:bin_folder = l:bin_folder . '/node_modules/.bin/'
  call CheckJavaScriptLinter(l:bin_folder . 'standard', 'standard')
  call CheckJavaScriptLinter(l:bin_folder . 'eslint', 'eslint')
endfunction

autocmd FileType javascript call SetupJavaScriptLinter()

" use 256 colors in terminal
if !has("gui_running")
  set t_Co=256
  set term=screen-256color
e
