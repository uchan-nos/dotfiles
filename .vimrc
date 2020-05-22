if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  "call dein#add('Shougo/deoplete.nvim')
  "if !has('nvim')
  "  call dein#add('roxma/nvim-yarp')
  "  call dein#add('roxma/vim-hug-neovim-rpc')
  "endif

  call dein#load_toml('~/.vim/dein.toml',      {'lazy': 0})
  call dein#load_toml('~/.vim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

set et sw=2 sts=2 ts=8
set list
set listchars=tab:>\ ,trail:-
set incsearch
set hlsearch
set colorcolumn=80
colorscheme elflord

inoremap <C-c> <Esc>
