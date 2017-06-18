"Rod Treweek 

" Activate the NERDTree when launching vim
" autocmd vimenter * NERDTree
"
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before
endif

" ================ General Config ====================

" Default params for ack
let g:ackprg="ack -H --nocolor --nogroup --column"

" Default params for ctrlp
let g:ctrlp_map = '<leader>c'

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

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/Wombat'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/neocomplete'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/ctags.vim'
Plug 'avakhov/vim-yaml'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'dearrrfish/vim-applescript'
Plug 'gabrielelana/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'morhetz/gruvbox'
Plug 'PProvost/vim-ps1'
Plug 'tpope/vim-fugitive'
Plug 'voxpupuli/vim-puppet'
Plug 'Valloric/YouCompleteMe'
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
set history=1000                  " Store lots of :cmdline history
set showmode                      " Show current mode down at the bottom
set gcr=a:blinkon0                " Disable cursor blink
set autoread                      " Reload files changed outside vim
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

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

set background=dark
colorscheme Wombat

syntax on

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1



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

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set linebreak    "Wrap lines at convenient points

" ================ Custom Settings ========================

" Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>

" ===== Seeing Is Believing =====
" " Assumes you have a Ruby with SiB available in the PATH
" " If it doesn't work, you may need to `gem install seeing_is_believing -v
" 3.0.0.beta.6`
" " ...yeah, current release is a beta, which won't auto-install
"
" " Annotate every line
"
nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
"
"  " Annotate marked lines
"
nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
"
"  " Remove annotations
"
nmap <leader>c :%.!seeing_is_believing --clean<CR>;
"
"  " Mark the current line for annotation
"
nmap <leader>m A # => <Esc>
"
"  " Mark the highlighted lines for annotation
"
vmap <leader>m :norm A # => <Esc>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <Leader>y "+y
map <Leader>d "+d

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

let g:spec_runner_dispatcher = "VtrSendCommand! {command}"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>

" For ruby block selections
runtime macros/matchit.vim

" For Running plain Ruby test scripts
nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>l :RunSpecLine<CR>
nnoremap <leader>e :RunSpecLastRun<CR>
nnoremap <leader>cr :RunSpecCloseResult<CR>


