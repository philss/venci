syntax on


set nocompatible

" Toggle past mode
set pastetoggle=<F2>

" Rspec command
let g:rspec_command = "Dispatch bundle exec rspec {spec} --color"
let g:rspec_runner = "os_x_iterm2"

" Vundle - you need to install it first. Check more details: https://github.com/gmarik/Vundle.vim
filetype off " required by vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'

" PLUGINS
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-rbenv'
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
Plugin 'Keithbsmiley/swift.vim'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rake'
Plugin 'rizzatti/dash.vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'mxw/vim-jsx'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/goyo.vim'

" Inception: install this repository to get ftplugins and other configurations
Plugin 'philss/venci'
" END PLUGINS

call vundle#end()
filetype indent plugin on

" Show partial commands in the last line of the screen
set showcmd

set t_Co=256
colorscheme solarized

let hour = str2nr(system('date +%H'), 10)

" Set the dark theme between 7 PM and 6 AM
if (hour > 18 || hour < 6)
  set background=dark
else
  set background=light
endif

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
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scss_checkers = ['scss_lint']
"let g:syntastic_ruby_checkers = ['rubocop']

" Airline - status bar
" You need to install powerline fonts in order to be able to " see some icons:
" $ git clone https://github.com/powerline/fonts.git && cd fonts
" $ ./install.sh
" (using Droid Sans Mono for Powerline)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Load config per project if '.vimrc.local' is present
if filereadable(glob("./.vimrc.local"))
  source ./.vimrc.local
endif

