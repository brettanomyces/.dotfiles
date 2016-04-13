" Plugins {{{
call plug#begin('~/.nvim/plugged')

Plug 'dag/vim-fish'
Plug 'mhinz/vim-sayonara'
Plug 'mhinz/neovim-remote'
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
" Plug '~/Workspace/nvim-editcommand'
Plug '~/Workspace/nvim-terminus'

call plug#end()

" }}}

" Settings {{{

" use <c-e> as leader so we can use it in terminal window too
let mapleader="\<c-e>"

set foldmethod=marker

" don't show vertical bar in split column
set fillchars-=vert:\|

" refrest screen less often
set lazyredraw

set incsearch
set hlsearch
set ignorecase
set smartcase
" don't wrap when searching file
set nowrapscan

" always show status bar
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

" allow unsaved buffers to be hidden
set hidden

" save backups to /tmp
set backupdir=/tmp

" }}}

" Plugin Settings {{{

" enable deoplete
let g:deoplete#enable_at_startup=1

" confirm before quitting vim
let g:sayonara_confirm_quit=1

" set scrollback buffer size to maximum
let g:terminal_scrollback_buffer_size = 100000

" nvim-editcommand
let g:editcommand_prompt = '>'
let g:editcommand_no_mappings = 1

" nvim-terminus
let g:terminus_default_mappings = 1

" }}}

" Abbreviations {{{

" use :close instead of :q to prevent exiting Neovim unintentionally, use :quit to quit
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<cr>

" }}}

" Mappings {{{

" nnoremap q: <nop>
nnoremap q/ <nop>
nnoremap q? <nop>

" avoid going into ex mode
nnoremap Q @q

" make Y act more like C and D
nnoremap Y y$

nnoremap j gj
nnoremap k gk

" avoid exiting nvim
nnoremap ZZ <nop>

" keep buffer, close window
nnoremap <leader>c :close<cr>
tnoremap <leader>c <c-\><c-n>:close<cr>

" close buffer, keep widow
nnoremap <leader>bd :Sayonara!<cr>
tnoremap <leader>bd <c-\><c-n>:Sayonara!<cr>

" close buffer, close window
nnoremap <leader>x :Sayonara<cr>
tnoremap <leader>x <c-\><c-n>:Sayonara<cr>

tnoremap <leader><esc> <c-\><c-n>
" remap in normal mode to prevent <c-e> scrolling the screen
nnoremap <leader><esc> <esc>

tnoremap <leader>h <c-\><c-n><c-w>h
tnoremap <leader>l <c-\><c-n><c-w>l
tnoremap <leader>j <c-\><c-n><c-w>j
tnoremap <leader>k <c-\><c-n><c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k

" open new terminal buffer
tnoremap <leader><space> <c-\><c-n>:TerminusOpen<cr>
nnoremap <leader><space> :TerminusOpen<cr>

" open new terminal buffer in horizontal split
tnoremap <leader>" <c-\><c-n>:below split +TerminusOpen<cr>
nnoremap <leader>" :below split +TerminusOpen<cr>

" open new terminal buffer in vertical split
tnoremap <leader>% <c-\><c-n>:vertical rightbelow split +TerminusOpen<cr>
nnoremap <leader>% :vertical rightbelow split +TerminusOpen<cr>

" rename buffer, useful for renaming terminal buffers
nnoremap <leader>f :call SetFileName()<cr>
tnoremap <leader>f <c-\><c-n>:call SetFileName()<cr>

" quickly switch buffers
nnoremap <M-Right> :bnext<cr>
tnoremap <M-Right> <c-\><c-n>:bnext<cr>
nnoremap <M-Left> :bprevious<cr>
tnoremap <M-Left> <c-\><c-n>:bprevious<cr>


" }}}

" Autocommands {{{

" set format option in an autocmd or they will be overridden when you open a
" new file
augroup Formatting
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

augroup Scratch
  autocmd!
  autocmd BufWinEnter * if &buftype == 'nofile' | call DeopleteEnable | endif
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

augroup SQL
  autocmd FileType sql setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" }}}

" Functions {{{

" set the name of the current buffer, useful for setting the name of terminal buffers
function! SetFileName()
  execute 'file ' . input('Enter name: ')
endfunction

" :Tail /path/to/file
function! Tail(file)
  enew
  call termopen('tail --follow=name --retry ' . fnameescape(a:file))
endfunction
command! -nargs=1 Tail call Tail(<f-args>)

" }}}

" Commands {{{

command! FormatJSON % !jq .

"}}}
