set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath


call plug#begin('~/.local/share/nvim/plugged')
if has('nvim')

	" Misc
	Plug 'ntpeters/vim-better-whitespace'
	"Plug 'robertmeta/nofrils'
	Plug 'altercation/vim-colors-solarized'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-easytags'
	Plug 'majutsushi/tagbar'
	Plug 'ctrlpvim/ctrlp.vim'

	" LaTeX
    " Plug 'lervag/vimtex'


	" Go
	Plug 'fatih/vim-go'

	" Error highlighting and syntax stuff
	Plug 'vim-syntastic/syntastic'
	Plug 'Raimondi/delimitMate'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Git
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'

	" Align CSV files at commas, align Markdown tables, and more
	Plug 'godlygeek/tabular'

endif
call plug#end()

set number
set wrap
filetype indent plugin on
syntax on
set mouse=a

set autowrite
set autoread

" use 4 spaces for tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- ntpeters/vim-better-whitespace settings -----

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Set the colorscheme
colorscheme solarized

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 0

" Use the solarized theme for the Airline status bar
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" ----- fatih/vim-go settings -----
" may make it slow
let g:go_fmt_command = "goimports"
let g:go_rename_command = "gopls"

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>



" ----- neoclide/coc.nvim settings -----

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



