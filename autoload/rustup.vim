let g:rustup#sysroot = ''

function! rustup#update_sysroot() " {{{
  if g:rustup#sysroot ==# '' && executable('rustc')
    let g:rustup#sysroot = substitute(system('rustc --print sysroot'), '\n', '', '')
  endif
endfunction " }}}

function! rustup#toolchain()
  call rustup#update_sysroot()
  return split(fnamemodify(g:rustup#sysroot, ':t'), '-')[0]
endfunction

function! rustup#source_path()
  call rustup#update_sysroot()
  let srcpath = expand(g:rustup#sysroot . '/lib/rustlib/src/rust/src')
  return isdirectory(srcpath) ? srcpath : ''
endfunction
