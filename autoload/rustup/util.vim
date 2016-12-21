"==============================================================================
" File:    util.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

" execute the command `rustup` if exists.
function! rustup#util#run(subcmd, ...) abort
  if !executable('rustup')
    return ''
  endif
  let args = map(filter(deepcopy(a:000), 'v:val !=# '''''), '''"'' . v:val . ''"''')
  echo args
  let cmd = join(['rustup', a:subcmd] + args, ' ')
  echo cmd
  return system(cmd)
endfunction

function! rustup#util#map_opt(arg, expr) abort
  return join(map(split(a:arg, '\n'), a:expr), '')
endfunction
