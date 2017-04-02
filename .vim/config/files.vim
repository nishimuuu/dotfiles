
"----------------------------------------------------------
" Unite&vimfilerの設定
"----------------------------------------------------------

" デフォルトのファイラーにする
let g:vimfiler_as_default_explorer = 1

" 横分割でトグル可能な終了しないファイラー
nnoremap <F2> :VimFiler -buffer-name=explorer -toggle -no-quit -split <Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()

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
