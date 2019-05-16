colorscheme nord
filetype plugin indent on
syntax on
runtime marcos/matchit.vim

set mouse=a
set laststatus=2
set cindent
set backspace=indent,eol,start
set incsearch
set ruler
set wildmenu
set number
set relativenumber
set history=50
set modifiable

call plug#begin()
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/vim-scripts/vim-auto-save.git'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tomtom/tcomment_vim'
call plug#end()

let g:tex_flavor = 'latex'
let g:deoplete#enable_at_startup = 1
let g:auto_save = 1
let g:UltiSnipExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

autocmd FileType tex :map <F5> :! pdflatex  -halt-on-error % && pkill -HUP mupdf <CR>
autocmd FileType tex :map <F9> :! mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
autocmd FileType cs :map <F5> :! clear && mcs /reference:System.Numerics.dll % && echo "\n\n\n" && mono $(echo % \| sed 's/cs/exe/') <CR>
autocmd FileType cs :map <F9> :! clear && mono $(echo % \| sed 's/cs$/exe/') <CR>
autocmd BufWinEnter * setlocal modifiable

nmap <C-p> :Files<CR>
nmap <C-n> :NERDTreeToggle<CR><CR>
nmap T :terminal<CR>a<CR>
imap <C-s> <Esc> :w<CR><CR>

" Go yo map
map <C-f> :Goyo<CR><CR>

" Map split switcher
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w> <C-w>w

" Clipboard
" map <C-S-v> "+P
vnoremap <C-c> "+y

" Automatically deletes all trailing whitespace on save.
map <F2> :%s/\s\+$//e<CR><CR>

map <C-j> <Esc>/<++><Enter><Esc>"_4s
imap <C-j> <Esc>/<++><Enter><Esc>"_4s
" Some latex snippets
autocmd FileType tex inoremap ,center \begin{center}<Enter>\end{center}<++><Esc>O
autocmd FileType tex inoremap ,left \begin{flushleft}<Enter>\end{flushleft}<++><Esc>O
autocmd FileType tex inoremap ,right \begin{flushright}<Enter>\end{flushright}<++><Esc>O
autocmd FileType tex inoremap ,frame \begin{frame}{<++>}<Enter><++><Enter>\end{frame}<++><Esc>02k
autocmd FileType tex inoremap ,item \begin{itemize}<Enter><++><Enter>\end{itemize}<++><Esc>02k
autocmd FileType tex inoremap ,enum \begin{enumize}<Enter><++><Enter>\end{enumize}<++><Esc>02k
autocmd FileType tex inoremap ,align \begin{align}<Enter><++><Enter>\end{align}<++><Esc>02k
autocmd FileType tex inoremap ,*align \begin{align*}<Enter><++><Enter>\end{align*}<++><Esc>02k
autocmd FileType tex inoremap ,eqn \begin{equation}<Enter><++><Enter>\end{equation}<++><Esc>02k
autocmd FileType tex inoremap ,*eqn \begin{equation*}<Enter><++><Enter>\end{equation*}<++><Esc>02k
autocmd FileType tex inoremap ,rray \begin{array}{<++>}<Enter><++><Enter>\end{array}<++><Esc>02k<C-j>
autocmd FileType tex inoremap ,frac \frac{0}{<++>}<++><Esc>F0"_s
autocmd FileType tex inoremap ,4 $0$ <++><Esc>F0"_s
" Auto ibus engine
autocmd InsertEnter * :silent ! ibus engine Bamboo
autocmd InsertLeave * :silent ! ibus engine xkb:us::eng 
autocmd VimEnter * :silent ! ibus engine Bamboo

" Ibus toggling
map <F3> :silent !~/.config/nvim/ibus-daemon-toggle.sh<CR><CR>

