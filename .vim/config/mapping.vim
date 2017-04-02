
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
"


set pastetoggle=<C-p>
" コマンド履歴の打ち間違い抑止
" q:、q/、q? は無効化
:nnoremap q: <NOP>
:nnoremap q/ <NOP>
:nnoremap q? <NOP>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
""inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
""inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
