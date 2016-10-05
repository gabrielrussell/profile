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
"set ttymouse=xterm2
set number
set ruler
set scrolloff=2
set shiftwidth=4
set showmatch
set smartindent
set softtabstop=4
set tabstop=8
set wildmode=list:longest
set formatoptions=tcro
set statusline=%f[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set tags+=/usr/include/tags,./tags;/
set cc=100

set rtp+=~/.vim/bundle/Vundle.vim/

filetype off

call vundle#begin()

Plugin 'fatih/vim-go'
Plugin 'gmarik/vundle'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-startify'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

filetype plugin indent off

if has('xterm_clipboard')
    set clipboard=unnamed,autoselect
endif

let g:go_fmt_command="gofmt"

colorscheme molokai

let mapleader = ','

autocmd BufWinEnter * if expand("%") != "" | loadview | endif
autocmd BufWinLeave * if expand("%") != "" | mkview | endif

filetype plugin indent on
syntax on

set title

autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

map <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/g 
map <leader>R :'<,'>s/\<<C-r><C-w>\>/<C-r><C-w>/g 
map <Leader>cc :setlocal errorformat=%f<CR>:cb<CR>

map <Leader>] :Ag <cword><Return>

map <Leader>h :bp<Return>
map <Leader>l :bn<Return>
map <Leader><Left> :bp<Return>
map <Leader><Right> :bn<Return>
map <Leader><BS> :bd<Return>

map tn :NERDTreeToggle<CR>

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

"nmap <CR> :GoRun<CR>
source ~/.vim/createtoggle.vim

call MapToggle("ts","SyntaxToggle","syntax off","syntax enable")
call MapToggle("te","EasySaveToggle","map <CR> :w<CR>","unmap <CR>")

map tp :set paste!<CR>
map tz :setlocal spell! spelllang=en_us<CR>
map tl :set list!<CR>

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
