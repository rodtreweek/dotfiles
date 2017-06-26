"Rod Treweek

" Activate the NERDTree when launching vim
" autocmd vimenter * NERDTree

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

" Press the j 2 times in a row
:imap jj <Esc>

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
filetype on
filetype plugin on
filetype indent on
set title                         " Update the title of your window or your terminal
set ruler                         " Show me a ruler
set wrap                          " Wrap lines when they are too long
set showcmd                       " Show command in bottom bar
set nocursorline                  " Highlight current line
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
"colorscheme Wombat

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

" Enable indentation matching for =>'s
filetype plugin indent on
