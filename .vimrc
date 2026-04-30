" Paras Mittal's vimrc.
"
" Maintainer:           Paras Mittal <https://parasmittal.com>
" Former Maintainer:	The Vim Project <https://github.com/vim/vim>
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>


" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim


" Disable all Vim functionality that creates additional files, or stores
" data from text files elsewhere.
set nobackup
set noswapfile
set noundofile
set nowritebackup
set viminfofile=NONE

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" use spaces for indentation
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set autoindent

syntax on
set number

" Display current line and column on the bottom bar
set ruler

" already set in defaults.vim
set so=0

set incsearch

" Flash on the screen instead of making the bell sound
" set noerrorbells
" set visualbell
" I have these options off because the macOS terminal handles this nicely
" It flashes the screen when the sound is off
" If I don't have a visual bell option available I can enable these

set showcmd


" i used to use these in cs240
" nnoremap <F7> :tabprevious<CR>
" nnoremap <F8> :tabnext<CR>
" nnoremap <S-F7> :tabmove -1<CR>
" nnoremap <S-F8> :tabmove +1<CR>


let mapleader = " "
" copy the entire file to the clipboard
nnoremap <leader>y :%y+<CR>
" replace the entire file with the contents of the system clipboard
nnoremap <leader>p :%delete _<Bar>0put +<CR>


" I prefer to edit code with nowrap, read prose with wrap

set linebreak

nnoremap <leader>w :setlocal wrap!<CR>

" wrap for prose
autocmd FileType markdown,text,gitcommit,mail,rst,tex,asciidoc setlocal wrap linebreak

