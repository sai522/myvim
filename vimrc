if has("win32")
  set shell=cmd
  set shellcmdflag=/c
  set shellxquote=\"
endif

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'slim-template/vim-slim'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-scripts/python_match.vim'
Bundle 'neowit/vim-force.com'
Bundle 'vim-scripts/Get-Win32-Short-Name'
Bundle 'marijnh/tern_for_vim'
Bundle 'terryma/vim-multiple-cursors'
"Bundle 'ervandew/supertab'

" UltiSnips
let s:python_ver = 0
silent! python import sys, vim;
\ vim.command("let s:python_ver="+"".join(map(str,sys.version_info[0:3])))

" Python plugin bundles
if (has('python') || has('python3')) && s:python_ver >= 260
  Bundle 'SirVer/ultisnips'
endif
" UltiSnips

"
" Sinpmate related bundles
"
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "garbas/vim-snipmate"
"
" Optional:
"Bundle "honza/vim-snippets"
"" End Snipmate related
""

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
let mapleader=","

color jellybeans

set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

"Sai Settings
set showmatch
set incsearch
set wildignore=*.swp,*.bak,*.pyc,*.class
set undolevels=1000
set visualbell
set noerrorbells

"let g:tagbar_ctags_bin="C:\\apps\\ctags58\\ctags58\\ctags.exe"
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

"" YouCompleteMe
"let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
"let g:UltiSnips#ExpandTrigger="<c-tab>"
"let g:UltiSnips#ListSnippets="<c-s-tab>"

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"


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
let g:solarized_italic=0    "default value is 1
let g:solarized_termcolors=256
"colorscheme solarized
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

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'

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
  set guifont=Monaco:h13
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
  set guifont=Consolas:h12
endif

" Force.com Stuff
" 
if has("win32")
	let g:apex_tooling_force_dot_com_path = "c:\\apps\\apex\\toolling-force.com-0.1.3.jar"
 	if !exists("g:apex_backup_folder")
 		" full path required here, relative may not work
 		let g:apex_backup_folder="c:\\temp\\apex\\backup"
 	endif
 	if !exists("g:apex_temp_folder")
 		" full path required here, relative may not work
 		let g:apex_temp_folder="c:\\temp\\apex\\gvim-deployment"
 	endif
 	if !exists("g:apex_properties_folder")
 		" full path required here, relative may not work
 		let g:apex_properties_folder="c:\\projects\\vim-force.com\\secure-properties"
 	endif
 	let g:apex_binary_tee = "c:\\cygwin64\\bin\\tee.exe"
 	let g:apex_binary_touch = "c:\\cygwin64\\bin\\touch.exe"
 endif	

