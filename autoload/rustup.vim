"==============================================================================
" File:    rustup.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

let g:rustup#sysroot = ''

function! rustup#update_sysroot() " {{{
  if g:rustup#sysroot ==# '' && executable('rustc')
    let g:rustup#sysroot = substitute(system('rustc --print sysroot'), '\n', '', '')
  endif
endfunction " }}}

function! rustup#show()
  execute '!rustup show'
endfunction

function! rustup#source_path()
  call rustup#update_sysroot()
  let srcpath = expand(g:rustup#sysroot . '/lib/rustlib/src/rust/src')
  return isdirectory(srcpath) ? srcpath : ''
endfunction
