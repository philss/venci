syntax on

set background=dark

set nocompatible
" Toggle past mode
set pastetoggle=<F2>

"Rspec command
let g:rspec_command = "! bundle exec rspec {spec}"

" Vundle - you need to install it first. Check more details: https://github.com/gmarik/Vundle.vim
filetype off " required by vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

" PLUGINS
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'elixir-lang/vim-elixir'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'carlosgaldino/elixir-snippets'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'rodjek/vim-puppet'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shutnik/jshint2.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/syntastic'

" Inception: install this repository to get ftplugins and other configurations
Plugin 'philss/venci'
" END PLUGINS

call vundle#end()
filetype indent plugin on

" Show partial commands in the last line of the screen
set showcmd

colorscheme solarized
set t_Co=256

" Enable light line
set laststatus=2

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

" IDENTATION -----------------------------------

" Indentation settings for using 2 spaces instead of tabs.
" " Do not change 'tabstop' from its default value of 8 with this setup.
set ts=2 sw=2 sts=2
set expandtab

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
nnoremap <C-L> :nohl<CR><C-L>

" MAPPINGS --------------------------------------

" Mapping <tab> to change navigate on tabs
nmap <tab> :tabnext<CR>
" Mapping control + <tab> to go to the previous tab
nmap <S-tab> :tabprevious<CR>

" map to make it use to use zenconding
map! <C-Z>, <C-Y>,

" Open file under cursor in another tab
map gft <C-w>gf<CR>

" BOOT
" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" max of open tabs opened
set tabpagemax=100

" Blank spaces killer
" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd WinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Run to clean them all
command FixSpaces %s/\s\+$/

" reload the file on changes
set autoread

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

set clipboard=unnamed

" copy and cut to clipboard
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-x> :!pbcopy<CR>

" Linters - JS and SCSS

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scss_checkers = ['scss_lint']
