
if has("mac")
  :nnoremap <leader>om :silent !open -a Marked.app '%:p'<cr>:redraw!<cr>
endif

let g:quickrun_config = {}
let g:quickrun_config.md = {
      \ 'outputer' : 'null',
      \ 'command'  : 'open',
      \ 'cmdopt'   : '-a',
      \ 'args'     : 'Marked',
      \ 'exec'     : '%c %o %a %s',
      \ }
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

"マウス操作可能
if has("mouse")
  set mouse=a
endif

"クリップボードとヤンクを共有
"vim --version | grep clipboard にて+になってれば使える
set clipboard=unnamed,autoselect

"Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"----------------------------------------------------------
" 自動syntaxチェックの設定 syntastic
"----------------------------------------------------------
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html'] }
let g:syntastic_auto_loc_list = 1
