"==============================================================================
" File:    target.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#target#list(toolchain) abort
  let args = a:toolchain ==# '' ? [] : ['--toolchain=' . a:toolchain]
  return map(rustup#util#run('target', ['list'] + args), 'substitute(v:val, '' (default)$'', '''', ''g'')')
endfunction

function! rustup#target#add(target, toolchain) abort
  let args = a:toolchain ==# '' ? [] : ['--toolchain=' . a:toolchain]
  return rustup#util#run('target', ['add'] + args)
endfunction

function! rustup#target#remove(target, toolchain) abort
  let args = a:toolchain ==# '' ? [] : ['--toolchain=' . a:toolchain]
  call rustup#util#run('target', ['remove'] + args)
endfunction
