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
set laststatus=2
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
"set tags=./tags,tags,/Users/appleapple/Ti_tags
"set tags=./tags,tags,./coffee/tags
"set tags=./tags,../tags,../../tags,../../../tags
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
"  Edit Setting
"-----------------------------------------------------------
noremap YYP -y$o<ESC>p
":au BufEnter *.coffee,*.js execute ":lcd " . expand("%:p:h")
":au BufEnter * execute ":lcd " . expand("%:p:h")

"-----------------------------------------------------------
"  VNC Setting
"-----------------------------------------------------------
inoremap -- =
inoremap "" '

"-----------------------------------------------------------
"  pathogen
"-----------------------------------------------------------
"filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
"set helpfile=$VIMRUNTIME/doc/help.txt
"filetype on
"filetype plugin on

"-----------------------------------------------------------
"  NeoBundle
"-----------------------------------------------------------
filetype plugin indent off
 
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/neobundle'))
endif
 
"NeoBundle
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/tpope/vim-pathogen.git'
"以下、インストールするプラグインのリポジトリを必要に応じて追記
NeoBundle 'git://github.com/Shougo/vimproc.git'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/echodoc'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'ujihisa/neco-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'thinca/unite-history'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'taglist.vim'
NeoBundle 'ref.vim'
NeoBundle 'fugitive.vim'
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'vtreeexplorer'
NeoBundle 'Tagbar'
NeoBundle 'FavEx'
NeoBundle 'camelcasemotion'
NeoBundle 'EasyMotion'
NeoBundle "git://github.com/tyru/caw.vim.git"

 
"pathogen
if isdirectory(expand('~/.vim/bundle/neobundle/vim-pathogen'))
  call pathogen#infect('~/.vim/bundle/pathogen')
"  call pathogen#helptags()
endif
 
filetype plugin indent on

"------------------------------------
" neocomplcache
"------------------------------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_snippets_dir='~/.vim/snippets'
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
cmap neoct NeoComplCacheCachingTags
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
cmap neoes NeoComplCacheEditSnippets

autocmd BufRead,BufNewFile *.coffee set ft=coffee

autocmd FileType javascript set include=^Ti\.include
"autocmd FileType coffee set include=*require

"autocmd FileType coffee set path=.,./coffee

autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=titanium#titaniumcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType coffee set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

"インクルードパスの指定
"let g:neocomplcache_include_paths = {'coffee': '.,./coffee'}
"  \ 'coffee': '.,/Users/appleapple/include',
"  \ 'cpp'  : '.,/opt/local/include/gcc46/c++,/opt/local/include,/usr/include',
"  \ 'c'    : '.,/usr/include',
"  \ 'ruby' : '.,/opt/local/lib/ruby1.9/1.9.1,/Users/rhayasd/programs',
"  \ 'perl' : '.,/System/Library/Perl,/Users/rhayasd/programs',
"  \ }
"インクルード文のパターンを指定
let g:neocomplcache_include_patterns = {'coffee': '*=\s*require('''}
  "\ 'coffee': '^\s*require',
  "\ 'cpp' : '^\s*#\s*include',
  "\ 'ruby' : '^\s*require',
  "\ 'perl' : '^\s*use',
  "\ }
"インクルード先のファイル名の解析パターン
let g:neocomplcache_include_exprs = {
  \ 'coffee' : 'simple.coffee'
  \ }
"  \ 'ruby' : substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
"  \ 'coffee' : substitute(v:fname,$,'.coffee','g')

" 現在のバッファのタグファイルを生成する
" neocomplcache からタグファイルのパスを取得して、tags に追加する
"nnoremap <expr><Space>tu g:TagsUpdate()
"function! g:TagsUpdate()
"    execute "setlocal tags=./tags,tags"
"    let bufname = expand("%:p")
"    for filename in neocomplcache#sources#include_complete#get_include_files(bufnr('%'))
"        execute "set tags+=".neocomplcache#cache#encode_name('include_tags', filename)
"    endfor
"    return ""
"endfunction



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

"------------------------------------
"" vimshell
"------------------------------------
"let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'

nnoremap <silent> ,vs :VimShell<CR>

"if has('mac')
"  set langmenu=japanese
"
"  if exists('$LANG') && $LANG ==# 'ja_JP.UTF-8'
"    set langmenu=ja_ja.utf-8.macvim
"    set encoding=utf-8
"    set ambiwidth=double
"  endif
"  
"endif

"------------------------------------
"" Unite
"------------------------------------
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" tab
nnoremap <silent> ,utb :<C-u>Unite tab<CR>
" tag
nnoremap <silent> ,utg :<C-u>Unite tag<CR>
" neocomplcache
imap <C-n> <Plug>(neocomplcache_snippets_unite_complete)
" Unite-tag
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> u<C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif
" Unite-vimshell-history
inoremap <buffer><expr> <C-l> unite#start_complete(
  \ ['vimshell/history'], {                                                                                                                  
  \ 'start_insert' : 0,
  \ 'input' : vimshell#get_cur_text()})

"------------------------------------
"" Taglist
"------------------------------------
"set tags=./tags
" taglist.vim: JavaScriptの表示対象を変更
let g:tlist_javascript_settings = 'javascript;c:class;m:method;f:function;F:function;p:property'
let g:tlist_coffee_settings = 'coffee;f:function;v:variable'

"------------------------------------
"" EchoDoc
"------------------------------------
let g:echodoc_enable_at_startup = 1 
