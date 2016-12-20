"==============================================================================
" File:    toolchain.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! s:list_toolchains()
  if !executable('rustup')
    return []
  endif
  return split(system('rustup toolchain list'), '\n')
endfunction

function! rustup#toolchain#list()
  return map(s:list_toolchains(), 'substitute(v:val, " (default)$", "", "g")')
endfunction

function! rustup#toolchain#install(name)
  if !executable('rustup')
    return
  endif
  call system('rustup toolchain install ' . a:name)
endfunction

function! rustup#toolchain#default()
  let candidates = filter(rustup#toolchain#list(), 'v:val =~ "(default)$"')
  if len(candidates) == 0
    return ''
  endif
  return substitute(candidates[0], ' (default)', '', 'g')
endfunction

