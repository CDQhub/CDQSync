set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" scrooloose/nerdtree setting
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" altercation/vim-colors-solarized setting
if has('gui_running')
	set background=light
	colorscheme solarized
else
	set background=dark
	colorscheme koehler
endif

" SimplyFold setting
let g:SimpylFold_docstring_preview=1
nnoremap <space> za

" airline setting
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
let g:airline_theme='bubblegum'
"let python_highlight_all=1

" mark badwhitespace with red
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"新建.c,.h,.sh,.java文件，自动插入文件头 
"定义函数SetTitle，自动插入文件头 
func SetTitle()
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call append(line(".")+1, "\#!/bin/bash") 
		call append(line(".")+2, "") 
	endif
	if &filetype == 'cpp'
	    call append(line(".")+1, "#include <iostream>")
		call append(line(".")+2, "using namespace std;")
		call append(line(".")+3, "")
	endif
	if &filetype == 'c'
		call append(line(".")+1, "#include <stdio.h>")
		call append(line(".")+2, "")
	endif
	"    if &filetype == 'java'
	"        call append(line(".")+1,"public class ".expand("%"))
	"        call append(line(".")+2,"")
    "    endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

" basic setting
syntax on
set backspace=indent,eol,start
set number
set ruler
set backspace=2
" set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set showcmd
set t_Co=256
set wrap
set linebreak
set showmatch
set hlsearch
set history=188
set scrolloff=5
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set clipboard=unnamed
set foldmethod=indent
set foldlevel=99
set cursorline
set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
