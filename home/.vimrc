"Rod Treweek

" Activate the NERDTree when launching vim
" autocmd vimenter * NERDTree
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required

" Add a mark and search
nmap <leader>j mA:Ack<space>
" Add a mark and search for the word under the cursor
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

" Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Let vim-plug manage things
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-endwise'
Plug 'stephpy/vim-yaml'
Plug 'godlygeek/tabular'
Plug 'PProvost/vim-ps1'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'godlygeek/tabular'
Plug 'voxpupuli/vim-puppet'
Plug 'w0rp/ale'
call plug#end()

" -- Display
" Enable syntax processing
syntax enable
set ruler                         " Show me a ruler

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1

set showcmd                       " Show command in bottom bar
set showmode                    " Show current mode.

" mail line wrapping
au BufRead /tmp/mutt-* set tw=72

set noswapfile                  " Don't use swapfile
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
" set ttyscroll=3               " noop on linux ?
set lazyredraw          	      " Wait to redraw "

" speed up syntax highlighting
set nocursorcolumn
set nocursorline
set showmatch                     " Highlight matching parenthesis

set backspace=indent,eol,start    " Sensible backspace behavior

" -- Search
set ignorecase                    " Ignore case when searching
set smartcase                     " If there is an uppercase in your search term
                                  " search case sensitive again
set incsearch                     " Highlight search results when typing
set hlsearch                      " Highlight search results

" -- Beep
set visualbell                    " Prevent Vim from beeping
set noerrorbells                  " Prevent Vim from beeping

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

set background=dark

syntax on

" set default comment color to cyan instead of darkblue
" which is not very legible on a black background
highlight comment ctermfg=cyan

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" trim all whitespaces away
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" dont save .netrwhist history
let g:netrw_dirhistmax=0

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" never do this again --> :set paste <ctrl-v> :set no paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" set 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" =================== vim-airline ========================

let g:airline_theme='luna'

" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")
if !g:remoteSession
  let g:airline_powerline_fonts=1
endif
