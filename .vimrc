runtime! plugin/sensible.vim
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set expandtab
set number
call pathogen#infect()
syntax enable
let g:syntastic_python_checkers=['pep8']
execute pathogen#infect()
syntax on
filetype plugin indent on

" show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" show long lines
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"set colorcolumn=81
" highlight ColorColumn ctermbg=darkyellow

" vundle {{{1

" needed to run vundle (but i want this anyways)
set nocompatible

source ~/.vim/plugins/highlight_errors.vim

" vundle needs filtype plugins off
" i turn it on later
filetype plugin indent off
syntax off

" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
call vundle#begin()

" list of plugins {{{2
" let Vundle manage Vundle (this is required)
Plugin 'gmarik/Vundle.vim'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean
" 

" YOUR LIST OF PLUGINS GOES HERE LIKE THIS:
Plugin 'bling/vim-airline'

" Editros config - https://github.com/editorconfig/editorconfig-vim
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'isRuslan/vim-es6'

Plugin 'othree/javascript-libraries-syntax.vim'

" add plugins before this
call vundle#end()

" now (after vundle finished) it is save to turn filetype plugins on
filetype plugin indent on
syntax on

" Auto-check file for errors on write:
let g:PyFlakeOnWrite = 1

let g:PyFlakeCheckers = 'pep8,mccabe,frosted'

let g:PyFlakeDefaultComplexity=10

let g:PyFlakeDisabledMessages = 'E501'

let g:PyFlakeAggressive = 0

let g:PyFlakeCWindow = 6 

let g:PyFlakeSigns = 1 

let g:PyFlakeSignStart = 1

let g:PyFlakeMaxLineLength = 100

let g:PyFlakeRangeCommand = 'Q'

" Key maps
map <C-e> <esc>:NERDTree<esc>
imap <C-e> <esc>:NERDTree<esc>
map j jzz
map k kzz
