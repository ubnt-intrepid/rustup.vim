"==============================================================================
" File:    component.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! s:list_components(toolchain)
  if !executable('rustup')
    return []
  endif
  let args = a:toolchain ==# '' ? '' : (' --toolchain=' . a:toolchain)
  return split(system('rustup component list' . args), '\n')
endfunction

function! rustup#component#list(...)
  return map(s:list_components(get(a:, 1, '')), 'substitute(v:val, " (.*)$", "", "g")')
endfunction

function! rustup#component#add(component, ...)
  if !executable('rustup')
    return
  endif
  let target = get(a:, 1, '')
  let toolchain = get(a:, 2, '')
  let args = target ==# '' ? '' : (' --target=' . target)
  let args = args . (toolchain ==# '' ? '' : (' --toolchain=' . toolchain))
  call system('rustup component add ' . component . args)
endfunction

function! rustup#component#remove(component, ...)
  if !executable('rustup')
    return
  endif
  let target = get(a:, 1, '')
  let toolchain = get(a:, 2, '')
  let args = target ==# '' ? '' : (' --target=' . target)
  let args = args . (toolchain ==# '' ? '' : (' --toolchain=' . toolchain))
  call system('rustup component remove ' . component . args)
endfunction
