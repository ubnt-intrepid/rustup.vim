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

function! rustup#override#unset(...) abort
  if !executable('rustup')
    return
  endif
  let path = get(a:, 1, '')
  let nonexistent = get(a:, 2, '')
  let args = path ==# '' ? '' : (' --path ' . path)
  let args = args . (nonexistent ==# '' ? '' : ' --nonexsistent')
  call system('rustup override unset' . args)
endfunction
