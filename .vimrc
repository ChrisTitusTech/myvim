" -- VIM PLUG Setup and LOAD --
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

" Startup Settings
	syntax on
    let mapleader=" "
	set noerrorbells
	set tabstop=2 softtabstop=2
	set shiftwidth=2
	set expandtab
	set smartindent
    set nofoldenable
	set nowrap
	set smartcase
	set noswapfile
	set nobackup
	set incsearch
	set history=5000
	set nocompatible
	set number relativenumber
	colorscheme onedark 
    set background=dark
    set termguicolors
	filetype plugin on
	set encoding=utf-8
	set wildmenu
	set wildmode=longest,list,full
	set laststatus=2
	if !has('gui_running')
	  set t_Co=256
	endif
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	set spell spelllang=en_us
" Key Maps
	map <C-o> :NERDTreeToggle<CR>
	map <C-\> :Goyo<CR>
	vnoremap <C-c> "+y
	nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
    nnoremap <Leader>i :w !ix<CR>
" Persistent_undo
	set undodir=~/.vim/undodir"
	set undofile
	let g:undotree_WindowLayout = 2
" Tabedit keybinds
    nnoremap <Leader>1 1gt<CR>
    nnoremap <Leader>2 2gt<CR>
    nnoremap <Leader>3 3gt<CR>
    nnoremap <Leader>4 4gt<CR>
    nnoremap <Leader>5 5gt<CR>
" Markdown Edits
    let g:vim_markdown_autowrite = 1
    let g:vim_markdown_no_extensions_in_markdown = 1
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_override_foldtext = 0
    let g:vim_markdown_folding_disabled = 1
