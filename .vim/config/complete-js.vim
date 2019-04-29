let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers=['eslint']

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1

command! EsFix :call vimproc#system_bg("eslint --fix " . expand("%"))
augroup javascript
  autocmd!
  autocmd BufWrite *.js,*.jsx EsFix
augroup END
