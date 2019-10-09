au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake
" enter the current millenium  https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
set nocompatible
set number

" plugins via pathogen
execute pathogen#infect()

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Display all matching files when we tab complete
set wildmenu

" colors
colorscheme gruvbox
