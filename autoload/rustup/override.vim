"==============================================================================
" File:    override.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#override#list() abort
  return map(split(rustup#util#run('override', 'list'), '\n'), 'split(v:val, "\t")')
endfunction

function! rustup#override#set(toolchain) abort
  return rustup#util#run('override', 'set', a:toolchain)
endfunction

function! rustup#override#unset(path, nonexistent) abort
  return rustup#util#run('override', 'unset',
        \ rustup#util#map_opt(a:path, '''--path='' . v:val'),
        \ rustup#util#map_opt(a:nonexistent, '''--nonexistent'''))
endfunction
