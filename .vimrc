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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
"Bundle 'Syntastic'
"let g:syntastic_mode_map['mode'] = 'passive'
Bundle 'vim-scripts/pig.vim'
Bundle 'vim-scripts/SuperTab'
Bundle 'jpalardy/vim-slime'
Bundle 'vim-scripts/VimClojure'
Bundle 'mattdenner/vim-scala'

"Bundle 'AutoComplPop'
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


filetype plugin indent on
"
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

""""""""""""""""""""""""""""""""""
syntax on             " Enable syntax highlighting

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set autoindent		" always set autoindenting on

set et
set ai
set ts=4
set sw=4
set number
set showmatch

set sts=4
set sta
set bs=2


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
augroup END 


"testing features

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

