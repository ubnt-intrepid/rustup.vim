"==============================================================================
" File:    target.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#target#list(toolchain) abort
  let targets = rustup#util#run('target', 'list',
        \ rustup#util#map_opt(a:toolchain, '''--toolchain='' . v:val'))
  let targets = split(targets, '\n')
  return map(targets, 'substitute(v:val, '' (default)$'', '''', ''g'')')
endfunction

function! rustup#target#add(target, toolchain) abort
  return rustup#util#run('target', 'add', a:target,
        \ rustup#util#map_opt(a:toolchain, '''--toolchain='' . v:val'))
endfunction

function! rustup#target#remove(target, toolchain) abort
  return rustup#util#run('target', 'remove', a:target,
        \ rustup#util#map_opt(a:toolchain, '''--toolchain='' . v:val'))
endfunction
