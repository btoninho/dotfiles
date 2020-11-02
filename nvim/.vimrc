


call plug#begin('~/.local/share/nvim/plugged')
if has('nvim')
    ""Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " c++
    "Plug 'zchee/libclang-python3' " dep for deoplete-clang
    " requires additional steps, check project
    "Plug 'zchee/deoplete-clang'

    " python
    "Plug 'zchee/deoplete-jedi'
    "Plug 'davidhalter/jedi-vim'
    "Plug 'nvie/vim-flake8'

    " misc
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'robertmeta/nofrils'
    "Plug 'tpope/vim-fugitive'
    "Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'dhruvasagar/vim-table-mode'
endif
call plug#end()


set number
filetype indent plugin on
syntax on
