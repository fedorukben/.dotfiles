" ################################///////////////////////////////////////////////
" @&@&@&@&@&@&@&@&@&@&@&@&@&@&@%%%%%%%%%%%%%%%%%%%%%#############################
" &&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%###############################
" @&@&@&@&@&@&@&@&@&@&@&@&%%%%%%%%%%%%%%%%%%%%%%#################################
" &&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%################################%%
" @&@&@&@&@&@&@&@&@&@&%%%%%%%%%%%%%%%%%%%%%%%%%###########################%%%%%%%
" &&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%####################%%%%%%%%%%%%%
" @&@&@&@&@&@&@&@&@&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" &&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" @&@&@&@&@&@&@&@&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" &&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" @&@&@&@&@&@&@&@&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" &&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&
" @&@&@&@&@&@&@&@&@&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&@&@&&%%%%%%%%%%%%%%%%%%%%%%%%%&&@&@&@&@&@&@&@&@&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@  &@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&& .&@&@&& .&@  &@&& . @&@,    @&@.  @&@&@&@&@&@&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&&&  &&&% ,&&&  &&&& #&&&&&* &&&&&&. &&&&&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&@&@  &% #&@&@  &@&& #&@&@&/ &&@&@&. @&@&@&@&@&@&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&&&&&   %&&&&&  &&&& #&&&&&/ &&&&&&. &&&&&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&@&@&@ @&@&@&@  &@&& #&@&@&/ &&@&@&. @&@&@&@&@&@&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@
" &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" @&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@&@

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""PLUGINS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" Requirement
Plug 'godlygeek/tabular'

" file explorer
Plug 'preservim/NERDTree'

" file tabs
Plug 'jistr/vim-nerdtree-tabs'

" super searching
Plug 'kien/ctrlp.vim'

" git integration
Plug 'tpope/vim-fugitive'

" displays markdowns
Plug 'plasticboy/vim-markdown'

" Python syntax highlighting
Plug 'vim-python/python-syntax'

" enables indent folding
Plug 'tmhedberg/SimpylFold'

" Adds better indentation for python
Plug 'vim-scripts/indentpython.vim'

" autocomplete shows up
" Plug 'vim-scripts/AutoComplPop'

" syntax checking
" Plug 'vim-syntastic/syntastic'

" PEP 8 checking
" Plug 'nvie/vim-flake8'

" solarized theme terminal
Plug 'jnurmine/Zenburn'

" solarized theme gui
Plug 'altercation/vim-colors-solarized'

" autocomplete Java
Plug 'artur-shaik/vim-javacomplete2'

"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

call plug#end() 

" Set compatibility to Vim only.
set nocompatible

" Helps force plugins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" Increase scroll depth
set scrolloff=10

" For plugins to load correctly.
filetype plugin indent on

" Terminal
" set splitbelow
" set termwinsize=10x0

" Turn off modelines
set modelines=0

"Turn on cursorlines
set cursorline

" Enable text wrap
set wrap

" Vim's auto indentation feature does not work properly with text copies from
" outside
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Show line numbers
set number

" Set cursor
let &t_SI = "\e[6 q" " 5 is blinking line, SI is insert mode 
let &t_EI = "\e[2 q" " 2 is steady block, EI is everything else 

" Set encoding
set encoding=utf-8

" Set syntax highlighting
let python_highlight_all=1
syntax on

" Powerline
set rtp+=/home/ben/.local/lib/python3.9/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

" PEP 8 indentation

" Full stack indentation
au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2
	\ set softtabstop=2
	\ set shiftwidth=2

" NERDTree ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']

" Autocommands
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:term '!python3' shellescape(@%, 1)<CR>

" Remaps
nnoremap <space> za
nnoremap <F2> :set invpaste paste?<CR>

" Imaps
" imap sysout<Tab> System.out.println("");<Left><Left><Left>

au VimLeave * :!clear
