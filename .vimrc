set autoindent
set autowrite
set background=dark
set backspace=2
"set complete=.,b,i,d,t,k
set complete=.,w,b,u,t
set completeopt=menuone,preview
set expandtab
"set foldcolumn=1
set hidden
set hls
set incsearch
set linebreak
"set mouse=a
set number
set ruler
set scrolloff=2
set shiftwidth=4
set showmatch
set smartindent
set softtabstop=4
set tabstop=8
set ttymouse=xterm2
set wildmode=list:longest
set formatoptions=tcro
set statusline=%f[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set tags+=/usr/include/tags,./tags;/

set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()

filetype off
filetype plugin indent off

Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter.git'
":GitGutterEnable, etc
Plugin 'mhinz/vim-startify'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
":Gstatus, etc
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-unimpaired'

call vundle#end()

if has('xterm_clipboard')
    set clipboard=unnamed,autoselect
endif

colorscheme slate

let mapleader = ','

autocmd BufWinEnter * if expand("%") != "" | loadview | endif
autocmd BufWinLeave * if expand("%") != "" | mkview | endif

filetype plugin indent on
syntax on

autocmd FileType go autocmd BufWritePre <buffer> GoFmt
autocmd FileType go set tabstop=2

set title
autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

map <Leader>] :Ag <cword><Return>

map <Leader>h :bp<Return>
map <Leader>l :bn<Return>
map <Leader><Left> :bp<Return>
map <Leader><Right> :bn<Return>
map <Leader><BS> :bd<Return>

source ~/.vim/createtoggle.vim

call MapToggle("ts","SyntaxToggle","syntax off","syntax enable")
call MapToggle("tp","Paste","set paste","set nopaste")
call MapToggle("te","SpellingToggle","setlocal spell spelllang=en_us","setlocal nospell")
call MapToggle("tl","ListToggle","set list","set nolist")
call MapToggle("tz","EasySaveToggle","map <CR> :w<CR>","unmap <CR>")
call MapToggle("tE","EasySaveMakeToggle","map <CR> :w<CR>:make<CR>","unmap <CR>")

call CreateToggle("HL", 'exec a:1 . "match hl" . a:1 . " /\\c".expand("<cword>")."/"', 'exec a:1 . "match"')
call CreateToggle("HLE", 'exec a:1 . "match hl" . a:1 . " /\\c\\<".expand("<cword>")."\\>/"', 'exec a:1 . "match"')

highlight hl1 term=bold cterm=bold gui=bold ctermbg=LightCyan  guibg=LightCyan
highlight hl2 term=bold cterm=bold gui=bold ctermbg=LightRed   guibg=LightRed
highlight hl3 term=bold cterm=bold gui=bold ctermbg=LightGreen guibg=LightGreen

map th1 :call HL("1")<CR>
map th2 :call HL("2")<CR>
map th3 :call HL("3")<CR>
map tH1 :call HLE("1")<CR>
map tH2 :call HLE("2")<CR>
map tH3 :call HLE("3")<CR>
