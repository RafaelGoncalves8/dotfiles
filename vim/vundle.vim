""""""""""
""Vundle""
""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'           "Vundle plugin installer
Plugin 'tomtom/tcomment_vim'            "gc modal comment style
Plugin 'terryma/vim-expand-region'      "v to expand ^v to reduce
Plugin 'christoomey/vim-tmux-navigator' "integration with tmux panes
Plugin 'scrooloose/syntastic'           "integrates spell checkers
Plugin 'vim-airline/vim-airline'        "airline statusbar
Plugin 'vim-airline/vim-airline-themes' "airline themes
Plugin 'tpope/vim-fugitive'             "git indicator
Plugin 'tpope/vim-vinegar'              "more functionalities :E mode
Plugin 'Shougo/unite.vim'               "buffer manager
Plugin 'gabrielelana/vim-markdown'      "plugin for taking notes using md

call vundle#end()

filetype plugin indent on

""Unite""
"""""""""
" opening in the same window
nmap <leader>u <nop>
nmap <leader>uf :Unite file -no-split -buffer-name=files<cr>
nmap <leader>ur :Unite file_mru -no-split -buffer-name=mru<cr>
nmap <leader>ub :Unite buffer -no-split -buffer-name=buffers<cr>
nmap <leader>uy :Unite history/yank -no-split -buffer-name=yank<cr>

" new window then Unite file
nmap <leader>nj :split<CR><c-w>j<Leader>uf
nmap <leader>nl :vsplit<CR><c-w>l<Leader>uf

""Fugitive""
""""""""""""
set statusline+=%{fugitive#statusline()}

""Vim expand region""
"""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

""Syntastic""
"""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = ">>"
let g:syntastic_style_symbol = "S>"
let g:syntastic_warning_symbol = "W>"
let g:syntastic_c_compiler_options = ' -ansi'
let g:syntastic_mode_map = { 'mode': 'passive',
                          \ 'active_filetypes': [],
                          \ 'passive_filetypes': [] }
let g:syntastic_auto_loc_list=1
nnoremap <silent> <F6> :SyntasticCheck<CR>
nnoremap <silent> <F7> :SyntasticCheck off<CR>

""Airline""
"""""""""""
let g:airline_theme='badwolf'

" ascii only symbols
" let g:airline_symbols_ascii = 1
" let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

set ttimeoutlen=10
set noshowmode

"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_left_sep = ' '
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_right_sep = ' '
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"

"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"
" Short mode indicator
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

" Buffers
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#buffer_idx_format = {
    \ '0': '0: ',
    \ '1': '1: ',
    \ '2': '2: ',
    \ '3': '3: ',
    \ '4': '4: ',
    \ '5': '5: ',
    \ '6': '6: ',
    \ '7': '7: ',
    \ '8': '8: ',
    \ '9': '9: '
    \}

"" Vim Markdown ""
""""""""""""""""""
let g:markdown_enable_spell_checking = 0
