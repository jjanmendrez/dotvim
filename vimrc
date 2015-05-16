execute pathogen#infect()
syntax on
filetype plugin indent on
set number
imap jk <Esc>
let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
nmap ; :
cmap w!! w !sudo tee % > /dev/null
set wildmenu
set foldenable
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set t_Co=256
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono
"set guifont=Literation\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono
colorscheme gruvbox
set background=dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybrid'
map <C-n> :NERDTreeToggle<CR>
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree = 1
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
