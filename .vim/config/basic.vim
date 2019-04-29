
"----------------------------------------------------------
"基本設定
"----------------------------------------------------------
set enc=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileformat=unix
set ambiwidth=double
set history=5000
set cursorline
set noswapfile                 " スワップファイル作らない
set autoread                   " 他で書き換えられたら自動で読み直す
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set vb t_vb=                   " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set showcmd                    " コマンドをステータス行に表示
set hidden                     " 編集中でも他のファイルを開けるようにする
set showmatch                  " 括弧の対応をハイライト
set showcmd                    " 入力中のコマンドを表示
set number                     " 行番号表示
set ruler                      " カーソルが何行目の何列目に置かれているかを表示
set wildmenu                   " コマンド補完を強化
set wildchar=<tab>             " コマンド補完を開始するキー
set wildmode=list:full         " リスト表示，最長マッチ
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

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

