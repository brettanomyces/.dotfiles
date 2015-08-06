" Plugins {{{
call plug#begin('~/.nvim/plugged')

Plug 'mhinz/vim-sayonara'
Plug 'dag/vim-fish'
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-commentary'

call plug#end()

" }}}

" Settings {{{

" use <c-a> as leader so we can use it in terminal window too
let mapleader="\<c-b>"

set foldmethod=marker

" don't show vertical bar in split column
set fillchars-=vert:\|

set incsearch
set hlsearch
set ignorecase
set smartcase

" always show status ba
set laststatus=2

" show line and column in status bar
set ruler

" don't use wildmenu
set nowildmenu

" always show 10 lines above or below cursor
set scrolloff=10

" show as much of the last line as possible
set display+=lastline

" display tabs as ▸·
set listchars=tab:▸·
" set listchars+=space:␣
" set listchars+=eol:¬
set list

" disable mouse
set mouse=

" yank to system clipboard
set clipboard=unnamedplus

" open split below and to the right
set splitbelow
set splitright

" }}}

" Plugin Settings {{{

" enable deoplete
let g:deoplete#enable_at_startup=1

" confirm before quitting vim
let g:sayonara_confirm_quit=1

" }}}

" Mappings {{{

" avoid going into ex mode
nnoremap Q @q

" make Y act more like C and D
nnoremap Y y$

nnoremap j gj
nnoremap k gk

" delete the current buffre but keep the current window
nnoremap <leader>c :Sayonara!<cr>

" delete the current buffer and closes the current window.
nnoremap <leader>x :Sayonara<cr>
tnoremap <leader>x <c-\><c-n>:Sayonara<cr>

tnoremap <leader><esc> <c-\><c-n>

tnoremap <leader>h <c-\><c-n><c-w>h
tnoremap <leader>l <c-\><c-n><c-w>l
tnoremap <leader>j <c-\><c-n><c-w>j
tnoremap <leader>k <c-\><c-n><c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k

tnoremap <leader>" <c-\><c-n>:below split term://fish<cr>
tnoremap <leader>% <c-\><c-n>:vertical rightbelow split term://fish<cr>
nnoremap <leader>" :below split term://fish<cr>
nnoremap <leader>% :vertical rightbelow split term://fish<cr>
" }}}

" Autocommands {{{

" set format option in an autocmd or they will be overridden when you open a
" new file
augroup Formatting
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

augroup Neovim 
  autocmd!
  " source on save and notify user
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | echom "sourced " . $MYVIMRC
  autocmd FileType vim setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup HTML 
  autocmd FileType html setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" }}}

