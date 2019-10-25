
" snakemake syntax
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake
" enter the current millenium  https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
set nocompatible
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mrk21/yaml-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-commentary'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" add yaml stuff
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

:let mapleader = ','
" Display all matching files when we tab complete
set wildmenu

" colors
colorscheme gruvbox

" encyption
setlocal cm=blowfish2     " best (requires Vim version 7.4.399 or higher)
