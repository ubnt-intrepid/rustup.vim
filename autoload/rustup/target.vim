"==============================================================================
" File:    target.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! s:list_targets(toolchain) abort
  if !executable('rustup')
    return []
  endif
  let args = a:toolchain ==# '' ? '' : (' --toolchain=' . a:toolchain)
  return split(system('rustup target list' . args), '\n')
endfunction

function! rustup#target#list(toolchain) abort
  return map(s:list_targets(a:toolchain), 'substitute(v:val, '' (default)$'', '''', ''g'')')
endfunction

function! rustup#target#add(target, toolchain) abort
  if !executable('rustup')
    return
  endif
  let args = a:toolchain ? '' : (' --toolchain=' . a:toolchain)
  call system('rustup target add ' . a:target . args)
endfunction

function! rustup#target#remove(target, toolchain) abort
  if !executable('rustup')
    return
  endif
  let args = a:toolchain ? '' : (' --toolchain=' . a:toolchain)
  call system('rustup target remove ' . a:target . args)
endfunction
