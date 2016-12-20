"==============================================================================
" File:    override.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#override#list() abort
  return map(split(rustup#util#run('override', ['list']), '\n'), 'split(v:val, "\t")')
endfunction

function! rustup#override#set(toolchain) abort
  return rustup#util#run('override', ['set', a:toolchain])
endfunction

function! rustup#override#unset(path, nonexistent) abort
  let args = (a:path ==# '' ? [] : ['--path ' . a:path]) +
        \ (a:nonexistent ==# '' ? [] : ['--nonexsistent'])
  return rustup#util#run('override', 'unset' + args)
endfunction
