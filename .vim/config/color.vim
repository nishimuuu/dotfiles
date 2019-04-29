
let g:airline_theme= 'hybrid'
syntax enable                      " 構文ハイライティング
"カラースキーマの定義
set background=dark
colorscheme hybrid_material
let g:vim_markdown_folding_disabled=1

" airlineデザイン

let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_b = 
  \ '%{airline#extensions#branch#get_head()}'.
  \ '%{""!=airline#extensions#branch#get_head()?(" " . g:airline_left_alt_sep . " "):""}'.
	\ '%t%(%M%)'
let g:airline_section_c = ""
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

function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction
