"==============================================================================
" File:    toolchain.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#toolchain#list() abort
  return map(split(rustup#util#run('toolchain', 'list'), '\n'), 'substitute(v:val, '' (default)$'', '''', ''g'')')
endfunction

function! rustup#toolchain#install(name) abort
  return rustup#util#run('toolchain', 'install', a:name)
endfunction
