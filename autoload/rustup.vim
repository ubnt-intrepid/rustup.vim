"==============================================================================
" File:    rustup.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#show()
  if !executable('rustup')
    return ''
  endif
  return system('rustup show')
endfunction

function! rustup#default(toolchain)
  if !executable('rustup')
    return ''
  endif
  return system('rustup default '. toolchain)
endfunction

function! rustup#run(toolchain, command, ...)
  if !executable('rustup')
    return ''
  endif
  let args = join(map(deepcopy(a:000), '"\"" . v:val . "\""'), ' ')
  return system('rustup run ' . a:toolchain . ' ' . a:command . ' ' . args)
endfunction

function! rustup#which(command)
  if !executable('rustup')
    return ''
  endif
  return system('rustup which ' . a:command)
endfunction
