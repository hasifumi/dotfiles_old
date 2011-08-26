"-----------------------------------------------------------
"  Basic Setting
"-----------------------------------------------------------
syntax on
set clipboard+=unnamed
set nobackup

"-----------------------------------------------------------
"  Encoding Setting
"-----------------------------------------------------------
:set enc=utf-8
:set fenc=utf-8
:set fencs=iso-2022-jp,enc-jp,cp932

"-----------------------------------------------------------
"  Display Setting
"-----------------------------------------------------------
set showcmd
set showmode
set showmatch
set title
"set list
"set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:,eol:$
"set listchars=tab:>-
set ruler
set number   " line number
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
"set laststatus=2
"set splitbelow
"set splitright
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

"-----------------------------------------------------------
"  Search Setting
"-----------------------------------------------------------
nmap <ESC><ESC> :nohlsearch<CR><ESC>
set incsearch

"-----------------------------------------------------------
"  Indent Setting
"-----------------------------------------------------------
set autoindent
set smartindent

"-----------------------------------------------------------
"  Completion Setting
"-----------------------------------------------------------
set complete+=k
set wildmenu
set wildchar=<TAB>

autocmd FileType pl :set dictionary+=~/.vim/dict/perl.dict
autocmd FileType js :set dictionary+=~/.vim/dict/javascript.dict

"-----------------------------------------------------------
"  Tags Setting
"-----------------------------------------------------------
nnoremap tt <C-]>
nnoremap tj :<C-u>tag<CR>
nnoremap tk :<C-u>pop<CR>
nnoremap tl :<C-u>tags<CR>

"-----------------------------------------------------------
"  Move Setting
"-----------------------------------------------------------
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

noremap <Space>j <C-f>
noremap <Space>k <C-b>

"-----------------------------------------------------------
"  pathogen
"-----------------------------------------------------------
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
filetype on
filetype plugin on

"------------------------------------
" neocomplcache
"------------------------------------
let g:neocomplcache_enable_at_startup=1
"let g:neocomplcache_enable_auto_select=1
"let g:neocomplcache_include_patterns = '*Ti.include*'
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default':'',
  \ 'javascript':$HOME.'/.vim/dict/javascript.dict',
  \ 'perl':$HOME.'.vim/dict/perl.dict'
  \ }
inoremap <expr><TAB> pumvisible()?"\<C-N>":"\<TAB>"
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

autocmd BufRead,BufNewFile *.coffee set ft=coffee

autocmd FileType javascript set include=^Ti\.include
autocmd FileType coffee set include=^Ti.include

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType coffee set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete


"------------------------------------
"" VTreeExplorer
"------------------------------------
""<Leader>t<Space>でディレクトリツリー表示
noremap <Leader>t<Space> :VSTreeExplore<CR>
"分割したウィンドウのサイズ
let g:treeExplWinSize=45
:colorscheme blackbeauty
:colorscheme koehler

let g:treeExplVertical=1

