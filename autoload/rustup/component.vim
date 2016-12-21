"==============================================================================
" File:    component.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#component#list(toolchain) abort
  let components = rustup#util#run('component', 'list',
        \ rustup#util#map_opt(a:toolchain, '''--toolchain='' . v:val'))
  let components = split(components, '\n')
  return map(components, 'substitute(v:val, '' (.*)$'', '''', ''g'')')
endfunction

function! rustup#component#add(component, target, toolchain) abort
  return rustup#util#run('component', 'add',
        \ rustup#util#map_opt(a:target, '''--target='' . v:val'),
        \ rustup#util#map_opt(a:toolchain, '''--toolchain='' . v:val'))
endfunction

function! rustup#component#remove(component, target, toolchain) abort
  return rustup#util#run('component', 'remove',
        \ rustup#util#map_opt(a:target, '''--target='' . v:val'),
        \ rustup#util#map_opt(a:toolchain, '''--toolchain='' . v:val'))
endfunction
