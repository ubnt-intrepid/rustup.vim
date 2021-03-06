"==============================================================================
" File:    rustup.vim
" Author:  Yusuke Sasaki <yusuke.sasaki.nuem@gmail.com>
" License: MIT
"==============================================================================

function! rustup#show() abort
  return rustup#util#run('show')
endfunction

function! rustup#update(toolchain) abort
  return rustup#util#run('update', a:toolchain)
endfunction

function! rustup#default(toolchain) abort
  return rustup#util#run('default', a:toolchain)
endfunction

function! rustup#run(toolchain, cmd, ...) abort
  return call('rustup#util#run', ['run', a:toolchain, a:cmd] + a:000)
endfunction

function! rustup#which(cmd) abort
  return rustup#util#run('which', a:cmd)
endfunction

function! rustup#doc(doctype) abort
  return rustup#util#run('doc', a:doctype)
endfunction

function! rustup#man(cmd, toolchain) abort
  execute '!rustup man ' . a:cmd . rustup#util#map_opt(a:toolchain, '''--toolchain='' . v:val')
endfunction


function! rustup#active_toolchain() abort
  let flag = 0
  for line in split(rustup#show(), '\n')
    if flag == 0
      if line ==# 'active toolchain'
        let flag = 1
      endif
      continue
    endif
    if line ==# '----------------'
      continue
    elseif line !=# ''
      return split(line, ' ')[0]
    endif
  endfor
  return ''
endfunction
