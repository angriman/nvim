" Basic editor settings
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set shiftwidth=2        " Indentation amount for < and > commands.
set tabstop=2           " Render TABs using this many spaces.
set linespace=0         " Set line-spacing to minimum.
set noexpandtab					" Avoid to put spaces instead of tabs.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a
												" join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
	set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
	set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Search
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set cpoptions+=x

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>()

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" Mapping colon for faster command typing
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

Plug 'altercation/vim-colors-solarized'
call plug#end()

"vim-airline"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.branch = '⎇'
let g:airline_solarized_bg='dark'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" configure which whitespace checks to enable.
" indent: mixed indent within a line
" long:   overlong lines
" trailing: trailing whitespace
" mixed-indent-file: different indentation in different lines
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long']

" Color scheme
syntax enable
set background=dark
colorscheme solarized

" YCM
let g:ycm_filetype_blacklist = {
	\ 'tex' : 1,
	\ 'plaintex' : 1,
	\ 'xml' : 1
\}
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/scripts/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']

" Additional YouCompleteMe config.
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Same as default, but with "markdown" and "text" removed.
let g:ycm_filetype_blacklist = {
	\   'notes': 1,
	\   'unite': 1,
	\   'tagbar': 1,
	\   'pandoc': 1,
	\   'qf': 1,
	\   'vimwiki': 1,
	\   'infolog': 1,
	\   'mail': 1
\}


" Disable unhelpful semantic completions.
let g:ycm_filetype_specific_completion_to_disable = {
	\  	'c': 1,
	\  	'gitcommit': 1,
	\  	'haskell': 1,
	\  	'javascript': 1,
	\ 	'ruby': 1
\}

let g:ycm_semantic_triggers = {
	\   'haskell': [
	\     '.',
	\     '(',
	\     ',',
	\     ', '
	\]
\}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

" NERDTree
" Automatically open NERDTree if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto formatting
augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
	autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
"	autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" Python
" Avoid configuration to be overridden by plugins in python files.
let g:python_recommended_style=0
let g:yapf_style="google"


" Auto reload vim configurations after writing init.vim
augroup myvimrchooks
	au!
	autocmd bufwritepost init.vim source ~/.config/nvim/init.vim
augroup END
