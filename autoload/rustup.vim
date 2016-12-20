"==============================================================================
" File:    rustup.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#show() abort
  if !executable('rustup')
    return ''
  endif
  return system('rustup show')
endfunction

function! rustup#default(toolchain) abort
  return rustup#util#run('default', [a:toolchain])
endfunction

function! rustup#run(toolchain, cmd, ...) abort
  return rustup#util#run('run', [a:toolchain, a:cmd] + deepcopy(a:000))
endfunction

function! rustup#which(cmd) abort
  return rustup#util#run('which', [a:cmd])
endfunction
