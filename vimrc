if has("win32")
  set shell=cmd
  set shellcmdflag=/c
  set shellxquote=\"
endif

set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'ap/vim-css-color'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jmcantrell/vim-virtualenv'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'jlanzarotta/bufexplorer.vim'
"Plugin 'shougo/neocomplete.vim'
"Plugin 'Shougo/dein.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

Plugin 'zchee/deoplete-jedi'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
call vundle#end()            " required
filetype plugin indent on     " required!
let g:python_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'
"
let mapleader=","

"call dein#add('Shougo/deoplete.nvim')
"if !has('nvim')
"  call dein#add('roxma/nvim-yarp')
"  call dein#add('roxma/vim-hug-neovim-rpc')
"endif

"Sai Settings
"
set cursorline
set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   "Indent by 4 spaces when pressing <TAB>

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable
if has ("autocmd")
  " File type detection. Indent based on filetype. Recommended.
  filetype plugin indent on
endif

set modelines=0
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set nowrap
set number
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

set showmatch
set incsearch
set wildignore=*.swp,*.bak,*.pyc,*.class
set undolevels=1000
set visualbell
set noerrorbells
"Indent guide setup
let g:indent_guides_enable_on_vim_startup = 1
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Powerline setup
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set guifont=Inconsolata\ for\ Powerline:h14
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
let g:Powerline_symbols = 'fancy'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2

function! ToggleNERDTreeAndTagbar()
  let w:jumpbacktohere = 1

  " Detect which plugins are open
  if exists('t:NERDTreeBufName')
    let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
  else
    let nerdtree_open = 0
  endif
  let tagbar_open = bufwinnr('__Tagbar__') != -1

  " Perform the appropriate action
  if nerdtree_open && tagbar_open
    NERDTreeClose
    TagbarClose
  elseif nerdtree_open
    TagbarOpen
  elseif tagbar_open
    NERDTree
  else
    NERDTree
    TagbarOpen
  endif

  " Jump back to the original window
  for window in range(1, winnr('$'))
    execute window . 'wincmd w'
    if exists('w:jumpbacktohere')
      unlet w:jumpbacktohere
      break
    endif
  endfor
endfunction
nnoremap <leader>n :call ToggleNERDTreeAndTagbar()<CR>

" format the entire file$
nnoremap <leader>fef gg=G''
"
"
"
" Switch between windows, maximizing the current window
"
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_


" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
"let g:solarized_italic=0    "default value is 1
syntax enable
if has('gui_running') 
  set background=dark
else
  set background=dark
endif
"let g:solarized_italic=0    "default value is 1
let g:solarized_termcolors=256
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1



" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" No show command
autocmd VimEnter * set nosc

" Quick ESC
" imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
" noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Resize buffers
if bufwinnr(1)
  nmap Ä <C-W><<C-W><
  nmap Ö <C-W>><C-W>>
  nmap ö <C-W>-<C-W>-
  nmap ä <C-W>+<C-W>+
endif

" NERDTree
"nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" CtrlP
"nnoremap <silent> t :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" CtrlP familiar to Command-T
silent! nnoremap <unique> <silent> <Leader>t :CtrlP<CR>

" CtrlP for buffers
silent! nnoremap <unique> <silent> <Leader>b :CtrlPBuffer<CR>

" CtrlP for tags
silent! nnoremap <unique> <silent> <Leader>T :CtrlPTag<CR>

" CtrlP for filetype
silent! nnoremap <unique> <silent> <Leader>f :CtrlPFiletype<CR>

" Go programming
" set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim

" Quit with :Q
"command -nargs=0 Quit :qa!

" MacVim GUI mode
if has("gui_macvim")
  "color jellybeans
  "set guifont=Monaco:h13
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=Inconsolata\ for\ Powerline:h18
  else
    set guifont=Monaco:h13
  endif
  set guioptions=aAce
  set fuoptions=maxvert,maxhorz
  set noballooneval

  " resize current buffer by +/- 5
  nnoremap <M-Right> :vertical resize +5<CR>
  nnoremap <M-Left>  :vertical resize -5<CR>
  nnoremap <M-Up>    :resize -5<CR>
  nnoremap <M-Down>  :resize +5<CR>

  " Command+Option+Right for next
  map <D-M-Right> :tabn<CR>
  " Command+Option+Left for previous
  map <D-M-Left> :tabp<CR>

  " Automatically resize splits
  " when resizing MacVim window
  autocmd VimResized * wincmd =
elseif has("gui_running")
  "color jellybeans
  set guifont=Inconsolata\ for\ Powerline:h15
  "set guifont=Consolas:h12
endif
"set transparency=35

