"==============================================================================
" File:    util.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

" execute the command `rustup` if exists.
function! rustup#util#run(subcmd, args) abort
  if !executable('rustup')
    return ''
  endif
  let args = join(map(deepcopy(a:args), ''' . v:val . '''), ' ')
  return system('rustup ' . a:subcmd . ' ' . args)
endfunction
