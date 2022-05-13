" vim-find-test: Find and open relative test class for current file
"
" Script Info  {{{
"=============================================================================
"      Licence: The MIT Licence (see LICENCE file)
" Name Of File: vim_find_test.vim
"  Description: Find and open relative test class for current file
"   Maintainer: Fabio Salvatori <fabbio852 at gmail.com>
"      Version: 0.0.1
"        Usage: Use :help  for information on how to configure and use
"               this script, or visit the Github page
"               https://github.com/fabiosal/vim-find-test
"
"=============================================================================
" }}}

" Do not source this script when python is not compiled in.
if !has('python3')
    echomsg ':python3 is not available, vim-find-test will not be loaded.'
    finish
endif

python3 import vim_find_test.finder
python3 finder = vim_find_test.finder.Finder()

command! FindTest python3 finder.find()
