""""""""""
""Vundle""
""""""""""
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

call vundle#end()

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
let g:syntastic_style_symbol = ">"
let g:syntastic_warning_symbol = "!!"
let g:syntastic_c_compiler_options = ' -ansi'
let g:syntastic_mode_map = { 'mode': 'passive',
                          \ 'active_filetypes': [],
                          \ 'passive_filetypes': [] }
let g:syntastic_auto_loc_list=1
nnoremap <silent> <F6> :SyntasticCheck<CR>
nnoremap <silent> <F7> :SyntasticCheck off<CR>

""Airline""
"""""""""""
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
set ttimeoutlen=10
set noshowmode

"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

