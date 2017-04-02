
set autoindent                 " 自動的にインデントする
set tabstop=2                  " タブの画面上での幅
set expandtab                  " タブをスペースに展開する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set ts=2
set sw=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=239
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
"----------------------------------------------------------
" インデントの関係
"----------------------------------------------------------
filetype indent plugin on
ab #r #coding:utf-8

let g:jedi#ts=2
let g:jedi#sw=2
