" Pathogen
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

" Set the font and window size
if has ('gui_running')
	"set guifont=PT\ Mono\ 10
	"set guifont=Envy\ Code\ R\ 10
    set guifont=Anonymous\ Pro\ 12
	set lines=50
	set columns=100
endif

" colorscheme slate
" colorscheme candycode
" colorscheme wuye
set background=dark
" colorscheme solarized
" colorscheme adaryn
" colorscheme af
" colorscheme xoria256-pluk
" colorscheme black_angus
" colorscheme kolor
" colorscheme lucius
" colorscheme jellybeans
colorscheme xoria256

" No vi compatibility
set nocompatible
set encoding=utf-8
let g:airline_detect_whitespace=0
let g:airline_powerline_fonts = 1
set laststatus=2

set tabstop=4
set expandtab 
set softtabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set number
set wrap
set linebreak
set nolist
set textwidth=0
"set clipboard=unnamedplus

" nnoremap j gj
" nnoremap k gk

" Save when focus is lost
" au FocusLost * :wa

" Turn on omnicompletion
filetype plugin on
set ofu=syntaxcomplete#Complete

let g:vim_markdown_folding_disabled=1

" Custom key combos
nmap <silent> <F3> :NERDTreeToggle<CR>

func! WordProcessorMode() 
  " setlocal formatoptions=1 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set thesaurus+=/home/rsezov/.vim/thesaurus/mthesaur.txt
  set complete+=s
  " setlocal linebreak 
  set wrap
  set textwidth=80
  " Look like WordStar
"  colorscheme adaryn
  colorscheme xoria256-blue
"  colorscheme transparent
  filetype detect

endfu 
com! WP call WordProcessorMode()

" Back to code mode
func! CodeMode()
        setlocal expandtab
        set textwidth=0
        colorscheme xoria256
        filetype detect
endfu
com! CODE call CodeMode()

" Idea: put a WRITE function here
" that makes the font really big. Then 
" vim can be maximized so the screen fills
" with a minimalistic editor with abou 90 columns
" to the width of the screen. 
"

""" FocusMode
function! ToggleFocusMode()
if (&foldcolumn != 12)
"    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
"    set noruler
    set nonumber
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0

    if has ('gui_running')
	   " set guifont=Envy\ Code\ R\ 18
        set guifont=Anonymous\ Pro\ 18
        set guioptions-=T
    endif

else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    set number
    execute 'colorscheme ' . g:colors_name

    if has ('gui_running')
           " set guifont=Envy\ Code\ R\ 10
            set guifont=Anonymous\ Pro\ 12
            set guioptions+=T
    endif

endif

endfunc

nnoremap <F4> :call ToggleFocusMode()<cr>
nnoremap <F5> :Latexmk<cr>
