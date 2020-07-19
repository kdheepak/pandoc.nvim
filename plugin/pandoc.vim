scriptencoding utf-8

if exists('g:loaded_pandoc_vim') | finish | endif

let s:save_cpo = &cpoptions
set cpoptions&vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! PandocCurrentFileToHTML lua require'pandoc'.pandoc("html")
command! PandocCurrentFileToPDF lua require'pandoc'.pandoc("pdf")
command! PandocCurrentFileToRST lua require'pandoc'.pandoc("rst")
command! PandocCurrentFileToMD lua require'pandoc'.pandoc("markdown")

""""""""""""""""""""""""""""""""""""""""""""""""""""""

let &cpoptions = s:save_cpo
unlet s:save_cpo

let g:loaded_pandoc_vim = 1
