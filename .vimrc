set nocompatible " required
filetype off     " required

" A minimal vim plugin manager
" curl curl -fLo ~/.vim/autoload/plug.vim --create-dirs lhttps://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()

" Color schemes
" Resources url: https://vimcolorschemes.com/
"
Plug 'jnurmine/Zenburn'
Plug 'crusoexia/vim-monokai'
Plug 'KeitaNakamura/neodark.vim'
Plug 'rakr/vim-one'
Plug 'acarapetis/vim-colors-github'
Plug 'ghifarit53/tokyonight-vim'

" foldmethod=indent creates more folds than you really want.
" The plugin `SimpylFold` can rectify that.
Plug 'tmhedberg/SimpylFold'

" Icons for NERDTree.
" Install Script
" $ git clone https://github.com/ryanoasis/nerd-fonts.git
" $ cd nerd-fonts
" $ sh install.sh
" Homebrew fonts:
" $ brew tap homebrew/cask-fonts
" $ brew install font-hack-nerd-font
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'

" File brwosing
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'

" ctags should be installed on your system, use `brew install ctags`
Plug 'preservim/tagbar'

" Syntax, highlight and autoformat
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'nvie/vim-flake8'

" Autocomplete
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Wiki and Markdown

Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'

" vim tmux navigator plugin
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

filetype plugin indent on " required

let mapleader = "'"

" 1. Basic Setting

set number
" set hlsearch
set nohlsearch
set cursorline
set scrolloff=10
set encoding=UTF-8

" Gui vim font setting
set guifont=hack_nerd_font:h21

" URL https://nickjanetakis.com/blog/change-your-vim-cursor-from-a-block-to-line-in-normal-and-insert-mode
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
" let &t_SI= "\e[6 q"
" let &t_EI= "\e[2 q"

" 2. Layout

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Specify different areas of the screen that the splits should occur.
set splitright
set splitbelow

" 3. Code Folding
set foldmethod=indent
set foldlevel=99

nnoremap <space> za

" import SimpylFold
let g:SimpylFold_docstring_preview = 1

" 4. File Explorer, Searching and Tagbar
"
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>l :TagbarToggle<cr>

let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.pyc$', '^__pycache__$', '\~$', '\.swp$']
let g:nerdtree_tabs_open_on_console_startup = 2

let g:NERDTreeMapJumpPrevSibling = ""
let g:NERDTreeMapJumpNextSibling = ""

" Ctrlp
let g:ctrlp_working_path_mode = 0 " Search all folders or files in root directory
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" 5. Syntax highlight, code format (code style), linting and auto complete
syntax on
set showmatch

" Autucomplete plugins settings
" YouCompleteMe

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<cr>

" ultishinppet
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltSnipsJumpForwardTrigger = '<C-N>'
let g:UltSnipsJumpBackwardTrigger = '<C-P>'
let g:UltSnipsSnippetDirectories = ['~/.local/snippets/']

" 6. python customization
autocmd BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 expandtab autoindent fileformat=unix

let g:ale_linters = {'python': ['pylint', 'flake8', 'pydocstyle', 'bandit', 'mypy']} " 'flake8', 'pydocstyle', 'bandit', 'mypy'
let g:ale_fixers = {'*': ['trim_whitespace'], 'python': ['black', 'isort']}
let g:ale_fix_on_save = 1

let python_highlight_all=1

" python with virtualenv support.
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), {"__file__": activate_this})
EOF

" 6. markdown
autocmd BufNewFile,BufRead *.md set shiftwidth=2 tabstop=2 expandtab softtabstop=2 fileformat=unix

nnoremap <Plug> <Plug>Markdown_OpenUrlUnderCursor
vnoremap <Plug> <Plug>Markdown_OpenUrlUnderCursor

let g:vimwiki_list = [{'path': '~/.local/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0
" Make vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

let g:vmt_auto_update_on_save = 0

" Copy and Paste
set clipboard=unnamedplus

" 9. Open your browser
" let g:netrw_nogx = 1 " disable netrw's gx mapping
" nmap gx <Plug>(openbrowser-smart-search)

" 10. Beautify the interface
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" colorscheme neodark
" set background dark

" Dev icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
