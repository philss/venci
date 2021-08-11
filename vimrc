" Enable all colors in neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Disable compatibility with older vi
set nocompatible
filetype off

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Langs
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-editors/vim-elixir'
Plug 'mxw/vim-jsx'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'wlangstroth/vim-racket'
Plug 'ElmCast/elm-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-rake'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'mracos/mermaid.vim'

" Plugins
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-mix-format'
Plug 'farmergreg/vim-lastplace'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'tamton-aquib/staline.nvim'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'


" Lang server
" watch out for Elixir LS setup:
" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#elixirls
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'

" ColorScheme
" Plug 'morhetz/gruvbox'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'

" Inception. Installs this repository to get ftplugins and other configurations
Plug 'philss/venci'

" Initialize plugin system
call plug#end()

" Toggle past mode
set pastetoggle=<F2>

" Show partial commands in the last line of the screen
set showcmd

set background=dark

let g:gruvbox_italic=1
colorscheme gruvbox

" Enable light line
set laststatus=2

" Enable buffer at status line
set showtabline=2

" A guide column to keep the code to a maximum of 100 chars
set colorcolumn=100

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" USABILITY -------------------------------------

"add some line space for easy reading
set linespace=4

" Use case insensitive search, except when using capital letters
set ignorecase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" " While this behaviour deviates from that of Vi, it does what most users
" " coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" " line of a window
set ruler

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

" IDENTATION -----------------------------------

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set tabstop=2
set sts=2
set expandtab

" MAPPINGS --------------------------------------

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
nnoremap <C-L> :nohl<CR><C-L>

" Mapping <tab> to change navigate on tabs
nmap <tab> :tabnext<CR>
" Mapping control + <tab> to go to the previous tab
nmap <S-tab> :tabprevious<CR>

" Open file under cursor in another tab
map gft <C-w>gf<CR>

" Max of open tabs opened
set tabpagemax=100

" Blank spaces killer
" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd WinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Run to clean trailing whitespace
command FixSpaces %s/\s\+$/

" Reload the file on changes
set autoread

set clipboard=unnamedplus

" Copy and cut an entire line to clipboard
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-x> :!pbcopy<CR>

" Function to Increment numbers in a column.
" Extracted from: http://vim.wikia.com/wiki/Making_a_list_of_numbers
function! IncrementNumbersInColumn()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction

" Map the above function to CTRL + a
vnoremap <C-a> :call IncrementNumbersInColumn()<CR>

" Linters - JS, SCSS and Ruby
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_scss_makers = ['scss_lint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_sml_enabled_makers = ['smlnj']
let g:neomake_html_tidy_ignore_errors = ['proprietary attribute "v-']

let g:neomake_error_sign = {'text': 'E>', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': 'W>', 'texthl': 'WarnMsg'}
let g:neomake_info_sign = {'text': 'I>', 'texthl': 'NeomakeInfoSign'}
let g:neomake_highlight_columns = 1

" Prettier linting errors
highlight NeomakeErrorSign ctermfg=124 cterm=bold
highlight NeomakeWarningSign ctermfg=31 cterm=bold

" It executes neomake every save of file
autocmd! BufWritePost * Neomake

" Neovim requires Python paths
let g:python_host_prog = '/usr/local/bin/python'

" Set the path as current directory. It enables search recursively by files in
" this directory.
set path=$PWD/**

" Config LangServer
lua << EOF
require'lspconfig'.elixirls.setup{
  cmd = { "/home/philip/sandbox/elixir-ls/release/language_server.sh" };
  on_attach = require'completion'.on_attach;
  elixirLS = {
    dialyzerEnabled = false,
    fetchDeps = false
  };
}

require'navigator'.setup()
-- require('staline').setup{}
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
