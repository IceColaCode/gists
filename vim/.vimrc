syntax on
set hlsearch
set nu
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
"set foldmethod=indent
"set pastetoggle=<F2>
let mapleader=' '
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprevious<cr>
nnoremap J gT
nnoremap K gt
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
com! FormatJSON %!python3 -m json.tool

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'w0ng/vim-hybrid'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
"need to first install
"brew install the_silver_searcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'tmhedberg/SimpylFold'
"自动缩进
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
" install tagbar need to run :
" brew tap universal-ctags/universal-ctags
" brew install --HEAD universal-ctags
Plug 'preservim/tagbar'
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
" 自动注释
Plug 'tpope/vim-commentary'
" git plug
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
call plug#end()

colorscheme hybrid

nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>A :Ag<CR>
nnoremap <leader>t :TagbarToggle<cr>

let NERDTreeShowHidden=1
let NERDTreeIgnore = [
	\ '\.git$', '\.hg$', '\.svn$', '\.pyc$', '\.pyo$', '\.swp$',
        \	]
let g:ctrlp_map = '<c-p>'
nmap ss <Plug>(easymotion-s2)

" python-mode
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc=1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_options_max_line_length = 120

" python environment setup
" PEP8
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

" Flagging Unnecessary Whitespace
" 我们希望避免出现多余的空白字符。可以让 Vim 帮我们标示出来，使其很容易发现并删除。
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" use utf-8
set encoding=utf-8
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), {'__file__': activate_this})
EOF

