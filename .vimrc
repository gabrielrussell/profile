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
set mouse=a
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

filetype off

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter.git'
":GitGutterEnable, etc
Plugin 'mhinz/vim-startify'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neocomplete'
":Gstatus, etc
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-unimpaired'

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

"autocmd FileType go autocmd BufWritePre <buffer> GoFmt

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

set title
autocmd BufEnter * let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"

map <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/g 
map <leader>R :'<,'>s/\<<C-r><C-w>\>/<C-r><C-w>/g 
map <Leader>] :Ag <cword><Return>

map <Leader>h :bp<Return>
map <Leader>l :bn<Return>
map <Leader><Left> :bp<Return>
map <Leader><Right> :bn<Return>
map <Leader><BS> :bd<Return>

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
