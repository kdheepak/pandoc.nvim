scriptencoding utf-8

if exists('g:loaded_pandoc_vim') | finish | endif

let s:save_cpo = &cpoptions
set cpoptions&vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! PandocCurrentFileToHTML lua require'pandoc'.pandoc("html")


""""""""""""""""""""""""""""""""""""""""""""""""""""""

let &cpoptions = s:save_cpo
unlet s:save_cpo

let g:loaded_pandoc_vim = 1
