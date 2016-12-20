"==============================================================================
" File:    component.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#component#list(toolchain) abort
  let args = a:toolchain ==# '' ? [] : ['--toolchain=' . a:toolchain]
  let components = rustup#util#run('component', ['list'] + args)
  return map(split(components, '\n'), 'substitute(v:val, '' (.*)$'', '''', ''g'')')
endfunction

function! rustup#component#add(component, target, toolchain) abort
  let args = (a:target ==# '' ? [] : ['--target=' . a:target]) +
        \ (a:toolchain ==# '' ? [] : ['--toolchain=' . a:toolchain])
  return rustup#util#run('component', ['add'] + args)
endfunction

function! rustup#component#remove(component, target, toolchain) abort
  let args = (a:target ==# '' ? [] : ['--target=' . a:target]) +
        \ (a:toolchain ==# '' ? [] : ['--toolchain=' . a:toolchain])
  return rustup#util#run('component', ['remove'] + args)
endfunction
