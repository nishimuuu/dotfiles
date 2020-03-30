
set autoindent                 " 自動的にインデントする
set tabstop=2             " タブの画面上での幅
set expandtab                  " タブをスペースに展開する
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set ts=2
set sw=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=239
"----------------------------------------------------------
" インデントの関係
"----------------------------------------------------------
filetype indent plugin on
ab #r #coding:utf-8
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

let g:terraform_fmt_on_save = 1
au BufWrite * :Autoformat

