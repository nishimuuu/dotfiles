" Create        : 2009/08/02 20:57
" Description   : vim7.0以降用、結構おもい

if has("mac")
  " markdownをMarked.appで開く
  :nnoremap <leader>om :silent !open -a Marked.app '%:p'<cr>:redraw!<cr>
endif
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }


"----------------------------------------------------------
" Vundleの設定,:BundleInstall
"----------------------------------------------------------
" Vundle Configuration
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/vundle.git
call vundle#rc()
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'vim-scripts/Vim-R-plugin'
NeoBundle 'eravandew/screen'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}
let g:quickrun_config.md = {
      \ 'outputer' : 'null',
      \ 'command'  : 'open',
      \ 'cmdopt'   : '-a',
      \ 'args'     : 'Marked',
      \ 'exec'     : '%c %o %a %s',
      \ }
NeoBundle 'tpope/vim-markdown'
NeoBundle 'bling/vim-airline'
let g:airline_enable_branch = 0
let g:airline_section_b = "%t %M"
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
      \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
      \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
      \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_right_sep = '◀'
let g:airline_left_sep = '▶'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'
let g:vim_markdown_folding_disabled=1
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'terryma/vim-multiple-cursors'

if has("lua")
  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
        \   'insert' : 1,
        \ }}
endif

NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}

NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}


NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
      \ }}

NeoBundleLazy 'tsukkee/unite-tag', {
      \ 'depends' : ['Shougo/unite.vim'],
      \ 'autoload' : {
      \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
      \ }}


Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-fugitive'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'ruby.vim'
Bundle 'QuickBuf'
Bundle 'neocomplcache'
Bundle 'xterm16.vim'
Bundle 'python.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Markdown'
Bundle 'git://github.com/kana/vim-fakeclip.git'
Bundle 'suan/vim-instant-markdown'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
"Bundle 'scrooloose/nerdtree'


"Bundle, NeoBundleまわりのインスコはここまで
"Kobitoとの連携
function! s:open_kobito(...)
  if a:0 == 0
    call system('open -a Kobito '.expand('%:p'))
  else
    call system('open -a Kobito '.join(a:000, ' '))
  endif
endfunction

" 引数のファイル(複数指定可)を
" Kobitoで開く
" "
" （引数無しのときはカレントバッファを開く
" command! -nargs=* Kobito call
" s:open_kobito(<f-args>)
" " Kobito を閉じる
" command! -nargs=0 KobitoClose call
" system("osascript -e 'tell application
" \"Kobito\" to quit'")
" " Kobito にフォーカスを移す
" command! -nargs=0 KobitoFocus call
" system("osascript -e 'tell application
" \"Kobito\" to activate'")

"syntax highlighting for json files
"au! BufRead,BufNewFile *.json set filetype = json
"augroup json_autocmd
"    autocmd!
"    autocmd FileType json setlocal autoindent
"    autocmd FileType json setlocal formatoptions = tcq21
"    autocmd FileType json setlocal textwidth = 78 shiftwidth = 2
"    autocmd FileType json setlocal expandtab
"    autocmd FileType json setlocal foldmethod = syntax
"augroup END








"----------------------------------------------------------
" キーバインド
"----------------------------------------------------------

" [インサートモード] でC-a, C-eを可能にする
inoremap <C-a> <Home>
inoremap <C-e> <End>

" [コマンドモード] でCtrl+Lで行番号を消す(コピペ用)
" 画面クリアと被ってるけど大丈夫か！？不安なので再描画も同時に行う
nmap <C-l> :set nonumber!<CR>:redr<CR>

" コマンドモードでもC-a, C-eを有効にする
map <C-a> ^
map <C-e> $

" セミコロン(;)を2回押すと開いているバッファを表示する
let g:qb_hotkey = ";;"

" Alt + ->, Alt+ <- で単語移動したい
" OSXだとAlt + 右矢印がfにマッピングされるのでwに再マッピング
map f w

" やり直し(Redo)をCtrl+uキーにも割り当て
" これでUndo, Redoをそれぞれu, Ctrl+r もしくは Ctrl+uで行える
map <C-u> <C-r>

" Ctrl+kを押してCtrl+fをするとインデント整形
map <C-k><C-f> gg=G

" Ctrl+pでペースト時のインデントを行うかどうかを切り替える
set pastetoggle=<C-p>

"----------------------------------------------------------
"基本設定
"----------------------------------------------------------
set enc=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileformat=unix
set noswapfile                 " スワップファイル作らない
set autoread                   " 他で書き換えられたら自動で読み直す
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set vb t_vb=                   " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set showcmd                    " コマンドをステータス行に表示
set hidden                     " 編集中でも他のファイルを開けるようにする
set autoindent                 " 自動的にインデントする
set tabstop=2                  " タブの画面上での幅
set expandtab                  " タブをスペースに展開する
set showmatch                  " 括弧の対応をハイライト
set showcmd                    " 入力中のコマンドを表示
set number                     " 行番号表示
set ruler                      " カーソルが何行目の何列目に置かれているかを表示
set wildmenu                   " コマンド補完を強化
set wildchar=<tab>             " コマンド補完を開始するキー
set wildmode=list:full         " リスト表示，最長マッチ
set history=100000             " コマンド・検索パターンの履歴数
set complete+=k	               " 補完に辞書ファイル追加
set wrapscan                   " 最後まで検索したら先頭へ戻る
set ignorecase                 " 大文字小文字無視
set smartcase                  " 大文字ではじめたら大文字小文字無視しない
set incsearch                  " インクリメンタルサーチ
set hlsearch                   " 検索文字をハイライト
set backspace=2                " バックスペースでインデントや改行を削除できるようにする
set formatoptions+=mM          " テキスト挿入中の自動折り返しを日本語に対応させる
set hlsearch                   " esc連打で検索ハイライトを消す
set clipboard+=autoselect      " ビジュアルモードの選択テキストをクリップボードに
set nobackup
syntax on                      " 構文ハイライティング

"----------------------------------------------------------
" インデントの関係
"----------------------------------------------------------
filetype indent plugin on
ab #r #coding:utf-8
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set ts=2
set sw=2


let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=202
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=154
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

"----------------------------------------------------------
"ステータスライン
"----------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L(%P)%m


"----------------------------------------------------------
"スペースに関する制御
"----------------------------------------------------------

"全角スペースの位置を表示
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

"行末のホワイトスペースの自動削除
"autocmd BufWritePre * :%s/\s\+$//e


"----------------------------------------------------------
"ファイルを開いたら前回のカーソル位置へ移動
"----------------------------------------------------------
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   exe "normal! g`\"" |
        \ endif
augroup END


"----------------------------------------------------------
"その他の設定
"----------------------------------------------------------

"マウス操作可能
if has("mouse")
  set mouse=a
endif

"クリップボードとヤンクを共有
"vim --version | grep clipboard にて+になってれば使える
set clipboard=unnamed,autoselect

"Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"カラースキーマの定義
colorscheme xterm16

" コマンド履歴の打ち間違い抑止
" q:、q/、q? は無効化
:nnoremap q: <NOP>
:nnoremap q/ <NOP>
:nnoremap q? <NOP>


"----------------------------------------------------------
" 自動後文チェックの設定 syntastic
"----------------------------------------------------------
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html'] }
let g:syntastic_auto_loc_list = 1


"----------------------------------------------------------
" Unite&vimfilerの設定
"----------------------------------------------------------

" デフォルトのファイラーにする
let g:vimfiler_as_default_explorer = 1

" 横分割でトグル可能な終了しないファイラー
nnoremap <F2> :VimFiler -buffer-name=explorer -toggle -no-quit -split -horizontal<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
"call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
"call unite#custom_action('file', 'my_vsplit', my_action)

" ファイル一覧
noremap <F1> :Unite -buffer-name=files file buffer<CR>
" 最近使ったファイルの一覧
" noremap <F2> :Unite file_mru<CR>
" history/yank
noremap <F3> :Unite register<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


"----------------------------------------------------------
" neocomplcacheの設定
"----------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Disable auto select
let g:neocomplcache_enable_auto_select = 0

" Ctrl+Space(<Nul>)を押したときだけ補完
" Ctrl+SpaceをCtrl+nに再割り当てしているだけ
let g:neocomplcache_disable_auto_complete = 1
inoremap <Nul> <C-n>

" Tabで補完表示
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
function! s:check_back_space()"{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}

" キャリッジリターンで選択できるようにする
" その際に改行をぶちこまない
" CRのマッピングを用いるプラグインと競合する模様:
" https://github.com/tpope/vim-endwise/issues/22
inoremap <expr><silent> <CR> <SID>my_cr_function()
function! s:my_cr_function()
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" 補完候補表示中にバックスペースを押下すると、補完をキャンセルする
inoremap <expr><C-h> pumvisible() ? neocomplcache#smart_close_popup().neocomplcache#undo_completion() : "\<C-h>"
inoremap <expr><BS> pumvisible() ? neocomplcache#smart_close_popup().neocomplcache#undo_completion() : "\<C-h>"

"setting color
colorscheme molokai
syntax on


"vi
set nocompatible

"indent
set autoindent

"increment search
set incsearch


"visible char
set list
set shiftwidth=2

vmap <silent> sy :~pbcopy; pbpaste<CR>
map <silent> sp <esc>o<esc>v :!pbpaste<CR>



" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup


"markdownの設定
"let g:vim_markdown_folding_disabled=1

"TeXの設定
filetype plugin on
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
