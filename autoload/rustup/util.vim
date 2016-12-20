"==============================================================================
" File:    util.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#util#source_path()
  if executable('rustc')
    let sysroot = substitute(system('rustc --print sysroot'), '\n', '', '')
  endif
  let srcpath = expand(sysroot . '/lib/rustlib/src/rust/src')
  return isdirectory(srcpath) ? srcpath : ''
endfunction

function! rustup#util#setup_src_path()
  let srcpath = rustup#util#source_path()
  if srcpath !=# ''
    let $RUST_SRC_PATH = srcpath
  endif
endfunction

