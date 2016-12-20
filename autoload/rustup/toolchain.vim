"==============================================================================
" File:    toolchain.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#toolchain#list() abort
  return map(split(rustup#util#run('toolchain', ['list']), '\n'), 'substitute(v:val, '' (default)$'', '''', ''g'')')
endfunction

function! rustup#toolchain#install(name) abort
  return rustup#util#run('toolchain', ['install', a:name])
endfunction

function! rustup#toolchain#default() abort
  let candidates = filter(rustup#toolchain#list(), 'v:val =~# ''(default)$''')
  if len(candidates) == 0
    return ''
  endif
  return substitute(candidates[0], ' (default)', '', 'g')
endfunction

