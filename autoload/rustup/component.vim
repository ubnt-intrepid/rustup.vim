"==============================================================================
" File:    component.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! s:list_components(toolchain) abort
  if !executable('rustup')
    return []
  endif
  let args = a:toolchain ==# '' ? '' : (' --toolchain=' . a:toolchain)
  return split(system('rustup component list' . args), '\n')
endfunction

function! rustup#component#list(toolchain) abort
  return map(s:list_components(a:toolchain), 'substitute(v:val, '' (.*)$'', '''', ''g'')')
endfunction

function! rustup#component#add(component, target, toolchain) abort
  if !executable('rustup')
    return
  endif
  let args = a:target ==# '' ? '' : (' --target=' . a:target)
  let args = args . (a:toolchain ==# '' ? '' : (' --toolchain=' . a:toolchain))
  call system('rustup component add ' . a:component . args)
endfunction

function! rustup#component#remove(component, target, toolchain) abort
  if !executable('rustup')
    return
  endif
  let args = a:target ==# '' ? '' : (' --target=' . a:target)
  let args = args . (a:toolchain ==# '' ? '' : (' --toolchain=' . a:toolchain))
  call system('rustup component remove ' . a:component . args)
endfunction
