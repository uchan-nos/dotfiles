if &compatible
  set nocompatible
endif

" Install dein
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif
" Add the dein installation directory into runtimepath
"set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

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
set scrolloff=2
set encoding=utf-8
"set fileencoding=utf-8
set ambiwidth=double
set modeline
colorscheme ron_vim81

" エンコーディングの自動検出
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,euc-jp,default,latin

inoremap <C-c> <Esc>

"for OpeLa language
autocmd BufNewFile,BufRead *.opl  set filetype=go

" for GNU global
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
set cscopeprg=gtags-cscope
if has('cscope')
  set cscopetag cscopeverbose
  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  map <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
endif

" To use the default key/mouse mapping:
let GtagsCscope_Auto_Map = 1
" To ignore letter case when searching:
"	let GtagsCscope_Ignore_Case = 1
" To use absolute path name:
"       let GtagsCscope_Absolute_Path = 1
" To deterring interruption:
"	let GtagsCscope_Keep_Alive = 1
" If you hope auto loading:
let GtagsCscope_Auto_Load = 1
" Don't show warning if GTAGS not found
let GtagsCscope_Quiet = 1
" To use 'vim -t ', ':tag' and '<C-]>'
set cscopetag
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

" WSL yank support
if executable('clip.exe')
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe', @0)
    augroup END
endif

" tokorom/vim-review
let g:vim_review#include_filetypes = ['c', 'python']
