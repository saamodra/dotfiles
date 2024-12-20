runtime! config/plugins.vim
runtime! config/coc.vim
runtime! config/treesitter.vim
runtime! config/functions.vim
runtime! config/mappings.vim
runtime! config/general.vim
runtime! config/indentations.vim

lua require('init')


" for git, add spell checking and automatic wrapping at 72 columns
autocmd Filetype gitcommit setlocal spell textwidth=120

" Set indentation to 2 spaces for HTML files
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

