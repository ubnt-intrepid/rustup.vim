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
  if !executable('rustup')
    return ''
  endif
  return system('rustup default '. a:toolchain)
endfunction

function! rustup#run(toolchain, command, ...) abort
  if !executable('rustup')
    return ''
  endif
  let args = join(map(deepcopy(a:000), '"\"" . v:val . "\""'), ' ')
  return system('rustup run ' . a:toolchain . ' ' . a:command . ' ' . args)
endfunction

function! rustup#which(command) abort
  if !executable('rustup')
    return ''
  endif
  return system('rustup which ' . a:command)
endfunction
