" Enable all colors in neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Disable compatibility with older vi
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" PLUGINS
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'carlosgaldino/elixir-snippets'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-markdown'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-rake'
Plugin 'rizzatti/dash.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'nielsmadan/harlequin'
Plugin 'scrooloose/vim-slumlord'
Plugin 'vim-utils/vim-troll-stopper'
Plugin 'reedes/vim-colors-pencil'
Plugin 'neomake/neomake'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'slashmili/alchemist.vim'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'chr4/sslsecure.vim'

" Langs

Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mxw/vim-jsx'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'ElmCast/elm-vim'

" Inception: install this repository to get ftplugins and other configurations
Plugin 'philss/venci'
" END PLUGINS

call vundle#end()
filetype indent plugin on

" Toggle past mode
set pastetoggle=<F2>

" Show partial commands in the last line of the screen
set showcmd

" Set terminal to 256 colors
" set t_Co=256
set background=dark

syntax enable
colorscheme solarized

" Toggle backgroud
call togglebg#map("<F5>")

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
set ts=2 sw=2 sts=2
set tabstop=2
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
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_scss_scss_lint_exec = '/Users/philip/.rbenv/shims/scss-lint'
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "v-']

let g:neomake_ruby_enabled_makers = ['rubocop', 'reek']
let g:neomake_scss_makers = ['scss_lint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_sml_enabled_makers = ['smlnj']
let g:neomake_html_tidy_ignore_errors = ['proprietary attribute "v-']
let g:neomake_scss_scss_lint_exec = '/Users/philip/.rbenv/shims/scss-lint'

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
let g:python3_host_prog = '/usr/local/bin/python3'

" Set the path as current directory. It enables search recursively by files in
" this directory.
set path=$PWD/**

" Load config per project if '.vimrc.local' is present
if filereadable(glob("./.vimrc.local"))
  source ./.vimrc.local
endif
