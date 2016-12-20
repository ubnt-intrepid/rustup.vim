"==============================================================================
" File:    override.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! s:list_overrides() abort
  if !executable('rustup')
    return []
  endif
  return split(system('rustup override list'), '\n')
endfunction

function! rustup#override#list() abort
  return map(s:list_overrides(), 'split(v:val, "\t")')
endfunction

function! rustup#override#set(toolchain) abort
  if !executable('rustup')
    return
  endif
  call system('rustup override set ' . a:toolchain)
endfunction

function! rustup#override#unset(path, nonexistent) abort
  if !executable('rustup')
    return
  endif
  let args = a:path ==# '' ? '' : (' --path ' . a:path)
  let args = args . (a:nonexistent ==# '' ? '' : ' --nonexsistent')
  call system('rustup override unset' . args)
endfunction
