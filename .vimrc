" Paras Mittal's vimrc. Adapted from the example.
" An example for a vimrc file.
"
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    " undofiles are really annoying
    " set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" its annoying
set nobackup

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

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
"set so=5

set incsearch

" Flash on the screen instead of making the bell sound
" set noerrorbells
" set visualbell
" I have these options off because the macOS terminal handles this nicely
" It flashes the screen when the sound is off
" If I don't have a visual bell option available I can enable these

set showcmd

nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>
nnoremap <S-F7> :tabmove -1<CR>
nnoremap <S-F8> :tabmove +1<CR>


let mapleader = " "
" copy the entire file to the clipboard
nnoremap <leader>y :%y+<CR>
" replace the entire file with the contents of the system clipboard
nnoremap <leader>p :%delete _<Bar>0put +<CR>


" chat written vimrc

" --- Markdown-specific UX ---
augroup MarkdownSettings
  au!
  autocmd FileType markdown call s:MarkdownSetup()
  " handy buffer-local toggles
  autocmd FileType markdown nnoremap <buffer> <leader>mw :setlocal wrap!<bar>setlocal linebreak<bar>setlocal breakindent<CR>
  autocmd FileType markdown nnoremap <buffer> <leader>mc :if &l:conceallevel==0 \| setlocal conceallevel=2 \| else \| setlocal conceallevel=0 \| endif<CR>
  autocmd FileType markdown nnoremap <buffer> <leader>cb I- [ ] <Esc>  " insert a checkbox at BOL
augroup END

function! s:MarkdownSetup() abort
  " Soft wrap, but at word boundaries (not mid-word)
  setlocal wrap
  setlocal linebreak
  setlocal breakindent
  setlocal breakindentopt=sbr,shift:2
  setlocal showbreak=↪\     " marker shown on wrapped screen lines

  " Don't insert hard newlines while typing
  setlocal textwidth=0
  setlocal formatoptions-=t
  setlocal formatoptions+=n   " keep numbered lists sane when formatting

  " Writer-friendly helpers
  setlocal spell spelllang=en_us
  setlocal complete+=kspell

  " See the markdown punctuation; toggle with <leader>mc
  setlocal conceallevel=0
endfunction

" One-shot: reflow the current paragraph to 80 cols, then go back to soft-wrap
autocmd FileType markdown nnoremap <buffer> <leader>fp :let b:_tw=&l:textwidth \| setlocal textwidth=80 \| normal! gqip \| let &l:textwidth=b:_tw \| unlet b:_tw<CR>
