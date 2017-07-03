"--- Plugins ---
call plug#begin('~/.vim/plugged')
    "--- Core ---
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'Raimondi/delimitMate'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'Yggdroot/indentLine' 
    "Plug 'benekastah/neomake'

    "--- Completion ---
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'davidhalter/jedi'
    Plug 'w0rp/ale'
    Plug 'Rip-Rip/clang_complete' "c/c++
    Plug 'neovimhaskell/haskell-vim' "haskel
    Plug 'sebastianmarkow/deoplete-rust' "rust

    "--- Colorschemes ---
    Plug 'chriskempson/base16-vim'
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'AlessandroYorba/Alduin'
    Plug 'davidklsn/vim-sialoquent'
    Plug 'octol/vim-cpp-enhanced-highlight'

    "--- C++/OpenGL features---
    Plug 'sheerun/vim-polyglot' "Syntax highlight for many languages
    Plug 'arakashic/chromatica.nvim'  "Better C family lang. syntax
    Plug 'mrtazz/DoxygenToolkit.vim'

    "--- Other plugins ---
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'ryanoasis/vim-devicons'
call plug#end()

"--- Visual options ---
let mapleader=","
set nocompatible
syntax on
set number
set nowrap
set ruler
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
set laststatus=2
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

"--- General options ---
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
filetype indent on
filetype plugin on
set autoindent
set wildmenu
set wildignorecase
set wildmode=list:longest,full
set autochdir
set foldmethod=indent

"-----	Custom Mapping ------
map <silent> <f3> :split<cr>
map <silent> <f4> :vsplit<cr>
inoremap <C-@> <c-x><c-o>
tnoremap <Esc> <C-\><C-n>


" Accidentally pressing Shift K will no longer open stupid man entry
noremap K <nop>

" New splits open to right and bottom
set splitbelow
set splitright

" ,c = Copy
map <Leader>c "+yy

" ,v = Paste
map <Leader>v "+gP

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" Wtf is Ex Mode
nnoremap Q <nop>


"------  Text Navigation  ------
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

"------  Buffer Navigation  ------
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" ,q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>
"nnoremap <silent> <Leader>q :bd<CR>

" ,Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>cot an editor comman bclose

"------  Searching  ------
set incsearch
set ignorecase
set smartcase
set hlsearch
set ignorecase smartcase

" Remove highlights with ,b
nnoremap <silent> <leader>b :nohlsearch<CR>

" Search keymap
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>


"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']
let NERDTreeHightlightCursorLine = 1

"setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2

" Toggle visibility using ,n
noremap <silent> <Leader>n :NERDTreeToggle<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Open NERDTree if we're executing vim without specifying a file to open
autocmd vimenter * if !argc() | NERDTree | endif

" Sets focus on main editing window, disable to set focus on NERDTree
autocmd VimEnter * wincmd p

" Close if only NERDTree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Hides "Press ? for help"
let NERDTreeMinimalUI=1


"------  Tagbar options  ------
let g:tagbar_width=26
noremap <silent> <Leader>y :! ctags -R .<CR> <bar> TagbarToggle<CR>
map <silent> <f2> :TagbarToggle<cr>


" ,ct = Builds ctags
map <Leader>ct :! ctags -R .<CR>


"------  Fugitive Plugin Options  ------
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gp :Ggrep
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git
nnoremap <Leader>gd :Gdiff<CR>


"------  Text Editing Utilities  ------
" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>

"--- GUI options ---
" Highlights the current line background
set cursorline
set mouse=a
set background=dark
let base16colorspace=256
colorscheme base16-default-dark
set colorcolumn=79
highlight Comment gui=italic
 "Enabling true colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Alt+n = new buffer
map <silent> <A-n> :enew<CR>


"--- CHROMATICA ---
"let g:chromatica#enable_at_startup=1
"let g:chromatica#responsive_mode=1


""-----	 GLSL	------
let g:glsl_default_version = 'glsl330'
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh, *.vs, *.fs'


"-----	CTAGS ---------
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50


"-----	DOXYGEN ---------
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Ondrej Hajek"
map <M-d> :Dox<CR>


"----- AIRLINE ----------
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_section_c = '%t'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab9
nmap <M--> <Plug>AirlineSelectPrevTab
nmap <M-tab> <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_left_sep = '█▓░'
let g:airline_right_sep = '░▓█'
let g:airline_left_alt_sep = '' "\ue0b1'
let g:airline_right_alt_sc1 = '' "''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' ☰'
"-------------------------

"---- YCM ---------------
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
nnoremap <silent> <Leader>e :ll<CR>

"---- DEV ICONS -----------
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
"---------------------------

"--- Neomake ---
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-Wall', '-Wextra', '-Weverything', '-pedantic', '-Wno-sign-conversion'],
   \ }
let g:neomake_cpp_enabled_makers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14"]

"--- DEOPLETE ---
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
    function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++14 -stdlib=libc++'
let g:clang_close_preview = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

"Rust deoplete
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/ohajek/.local/share/rust_src/rust/src'

"Automatic colorscheming from base16 in zsh
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
