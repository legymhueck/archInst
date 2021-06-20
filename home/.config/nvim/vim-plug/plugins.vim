" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
call plug#begin('~/.config/nvim/autoload/plugged')

    "Plug 'cloudhead/neovim-fuzzy'
    "Fancy look
    Plug 'morhetz/gruvbox'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " requires at least 0.5
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    "
    "Plug 'gruvbox-community/gruvbox'
    " Language Server
    "Plug 'neovim/nvim-lspconfig'
    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Python
    "Plug 'davidhalter/jedi-vim'
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "Plug 'zchee/deoplete-jedi'
    call plug#end()
"let g:deoplete#enable_at_startup = 1
colorscheme gruvbox
"nmap <leader>gd <Plug>(coc-definitions)
"nmap <leader>gr <Plug>(coc-references)
" Find files using Telescope command-line sugar.
let mapleader="\\"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <C-p> :Telescope find_files<CR>
