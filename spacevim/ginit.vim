"=============================================================================
" ginit.vim --- Entry file for neovim-qt
" Copyright (c) 2016-2022 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

if exists('g:GuiLoaded')
  if exists('g:spacevim_guifont') && !empty(g:spacevim_guifont)
    exe 'Guifont! ' . g:spacevim_guifont
  else
    exe 'Guifont! SauceCodePro Nerd Font Mono:h11:cANSI:qDRAFT'
  endif
  " As using neovim-qt by default

  " Disable gui popupmenu
  if exists(':GuiPopupmenu') == 2
    GuiPopupmenu 0
  endif

  " Disbale gui tabline
  if exists(':GuiTabline') == 2
    GuiTabline 0
  endif
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" vim:set et sw=2:

" set guifont=MesloLGM\ Nerd\ Font:h13
set guifont=jetBrainsMono\ Nerd\ Font:h15

call plug#begin('~/.SpaceVim.d/plugged')

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'davidhalter/jedi-vim'
Plug 'kaicataldo/material.vim', {'branch': 'main'}
Plug 'equalsraf/neovim-gui-shim' " for Ligatures
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

let g:airline_powerline_fonts = 1

" let g:airline#extensions#tabline#enabled = 1

let g:material_theme_style = "palenight"
colorscheme material

let g:python3_host_prog = "/usr/bin/python"
let g:neomake_rust_enabled_makers = ['rustc']

