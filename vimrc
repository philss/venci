" Enable all colors in neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Disable compatibility with older vi
set nocompatible
filetype off

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Langs
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'mxw/vim-jsx'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'wlangstroth/vim-racket'
Plug 'ElmCast/elm-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
Plug 'kylef/apiblueprint.vim'
Plug 'styled-components/vim-styled-components'
Plug 'hashivim/vim-hashicorp-tools'

" Plugins
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-troll-stopper'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'slashmili/alchemist.vim'
Plug 'chr4/sslsecure.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-mix-format'
Plug 'farmergreg/vim-lastplace'

" ColorScheme
Plug 'morhetz/gruvbox'

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

" Generate ctags with <leader>ct
set tags+=tags
nnoremap <leader>ct :silent ! ctags -R --languages=ruby --exclude=.git --exclude=log -f tags<cr>

" Opens XML files with xmllint
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

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

set clipboard=unnamed

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

" Airline - status bar
" You need to install powerline fonts in order to be able to " see some icons:
" $ git clone https://github.com/powerline/fonts.git && cd fonts
" $ ./install.sh
" (using Droid Sans Mono for Powerline)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Deoplete
let g:deoplete#enable_at_startup = 1

" Tern JS
let g:tern_request_timeout = 1
" This do disable full signature type on autocomplete
let g:tern_show_signature_in_pum = '0'

" Neovim requires Python paths
let g:python_host_prog = '/usr/local/bin/python'

" Configure the ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetsDir=$HOME.'/.config/ultisnips'

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/ultisnips']

" Set the path as current directory. It enables search recursively by files in
" this directory.
set path=$PWD/**

" Load config per project if '.vimrc.local' is present
if filereadable(glob("./.vimrc.local"))
  source ./.vimrc.local
endif
