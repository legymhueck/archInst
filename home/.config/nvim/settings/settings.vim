set spelllang=en,de
set spell
set encoding=utf-8
set exrc " automatically source
"set guicursor=
set relativenumber
set nohlsearch " no hightlight of word after search ended
set hidden " keeps everything open in the background without having to save it
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
"set nowrap
"set smartcasei
"set ignorecase "depend on each other
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8 "start scrolling when you are 8 away (from top or bottom)
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

" NERDTree Settings
nmap <C-f> :NERDTreeToggle<CR>

" Open NERDTree automatically
" autocmd VimEnter * NERDTree
