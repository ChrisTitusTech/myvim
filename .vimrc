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
Plug 'wakatime/vim-wakatime'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '907th/vim-auto-save'
call plug#end()

" Startup Settings
	syntax on
  let mapleader=" "
  let NERDTreeShowHidden=1
  let g:auto_save = 1
  let g:auto_save_events = ["InsertLeave", "TextChanged"]
  set mouse=a
  set clipboard=unnamedplus
  set cursorline
  highlight CursorLine ctermbg=Yellow cterm=bold guibg=#2b2b2b
	set noerrorbells
  set splitbelow splitright
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

" Plugin Shortcuts https://christitus.com
	map <Leader>f :NERDTreeToggle<CR>
	map <C-\> :Goyo<CR>
  nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
  nnoremap <C-f> :Files<CR>
  nnoremap <Leader>l :Tabularize /

" Copy Paste
	vnoremap <C-c> "+y
	map <C-v> "+gP
	cmap <C-V> <C-R>+

" General Shortcuts
  nnoremap S :%s//g<Left><Left>
  nmap <Leader>r :w<CR>:so %<CR>

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
  nnoremap <Leader>t :tabnew<CR>
  nnoremap <Leader>c :tabclose<CR>

" Markdown Edits
  let g:vim_markdown_autowrite = 1
  let g:vim_markdown_no_extensions_in_markdown = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_override_foldtext = 0
  let g:vim_markdown_folding_disabled = 1

" Markdown auto format tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
