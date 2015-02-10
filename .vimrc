" % is current filename
set nocompatible      " We're running Vim, not Vi!
filetype off

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

"Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

Plugin 'jpalardy/vim-slime'
"Plugin 'airblade/vim-gitgutter'
"highlight clear SignColumn
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'Syntastic'
"let g:syntastic_mode_map['mode'] = 'passive'

"Languages
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-git'

Plugin 'fatih/vim-go'
"Plugin 'jnwhiteh/vim-golang'
"go get code.google.com/p/go.tools/cmd/goimports
"let g:gofmt_command = "goimports"
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
"go get -u github.com/nsf/gocode
"Plugin 'nsf/gocode', {'rtp': 'vim/'}

Plugin 'vim-scripts/pig.vim'
Plugin 'autowitch/hive.vim'
Plugin 'derekwyatt/vim-scala'
"Plugin 'mattdenner/vim-scala'
Plugin 'rodjek/vim-puppet'
"Plugin 'vim-scripts/VimClojure'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
au VimEnter *.clj RainbowParenthesesToggle
au Syntax *.clj RainbowParenthesesLoadRound
au Syntax *.clj RainbowParenthesesLoadSquare
au Syntax *.clj RainbowParenthesesLoadBraces

"Plugin 'AutoComplPop'
if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif


filetype plugin indent on
"
 " Brief help
 " :PluginList          - list configured bundles
 " :PluginInstall(!)    - install(update) bundles
 " :PluginSearch(!) foo - search(or refresh cache first) for foo
 " :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Plugin command are not allowed..

""""""""""""""""""""""""""""""""""
syntax on             " Enable syntax highlighting

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set autoindent		" always set autoindenting on

set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set number
set showmatch

set softtabstop=4
set smarttab
set backspace=2

"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
""let g:solarized_contrast = 'high'
"set background=dark
"colorscheme solarized

"set background=light
"hi clear
"syntax reset


highlight Normal        guibg=Black guifg=Gray65
highlight Comment       guifg=DarkGreen ctermfg=DarkGreen
highlight Identifier    guifg=Gray ctermfg=Gray
highlight Statement     guifg=DarkCyan ctermfg=DarkCyan
highlight IncSearch     guifg=Cyan ctermfg=Cyan
highlight Search        guifg=Yellow ctermfg=Yellow
highlight Constant      guifg=Red gui=None
highlight Constant      ctermfg=Red cterm=none
highlight Type          guifg=Blue gui=none
highlight Type          ctermfg=Blue cterm=none


augroup filetypedetect 
      au BufNewFile,BufRead *.ec,*.EC,*.pc         setf esqlc
      au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
      au BufNewFile,BufRead *.hql set filetype=hive syntax=hive
augroup END 

"testing features
autocmd BufEnter * :syntax sync fromstart
set pastetoggle=<F2>

" disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

set wildmenu

"set nohlsearch
set hlsearch
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
nnoremap <C-L> :nohl<CR><C-L>

"higlight trailing whitespace
set list listchars=tab:\ \ ,trail:·

map <F3> :NERDTreeToggle<CR>

cmap w!! w !sudo tee % >/dev/null

