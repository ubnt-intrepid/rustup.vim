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
  let cmd = join(['rustup', a:subcmd] + args, ' ')
  return system(cmd)
endfunction

function! rustup#util#map_opt(arg, expr) abort
  if a:arg ==# ''
    return ''
  endif
  return map([a:arg], a:expr)[0]
endfunction
