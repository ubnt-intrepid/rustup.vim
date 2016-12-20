"==============================================================================
" File:    target.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! s:list_targets(target)
  if !executable('rustup')
    return []
  endif
  let args = a:target ==# '' ? '' : (' --toolchain=' . a:target)
  return split(system('rustup target list' . args), '\n')
endfunction

function! rustup#target#list(...)
  return map(s:list_targets(get(a:, 1, '')), 'substitute(v:val, " (default)$", "", "g")')
endfunction

function! rustup#target#add(target, ...)
  if !executable('rustup')
    return
  endif
  let args = len(a:000) == 0 ? '' : (' --toolchain=' . get(a:, 1, ''))
  call system('rustup target add ' . target . args)
endfunction

function! rustup#target#remove(target, ...)
  if !executable('rustup')
    return
  endif
  let args = len(a:000) == 0 ? '' : (' --toolchain=' . get(a:, 1, ''))
  call system('rustup target remove ' . target . args)
endfunction
