if has('gui')
    set guioptions-=m
    set guioptions-=T
endif
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nvie/vim-flake8'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'paradox41/material-color-scheme'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'dracula/vim'
Plugin 'stephpy/vim-yaml'
Plugin 'dense-analysis/ale'
call vundle#end()
filetype plugin indent on
autocmd BufEnter * let &colorcolumn="80,100"
autocmd BufWritePost *.py call Flake8()
autocmd BufRead,BufNewFile *.yaml,*.yml set syntax=yaml
syntax on
" colorscheme vividchalk
" colorscheme bubblegum-256-light
colorscheme dracula
set smartindent
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set incsearch
set hlsearch

if !&diff
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
endif
au InsertEnter * let b:oldfdm = &l:fdm | setlocal fdm=manual
au InsertLeave * let &l:fdm = b:oldfdm
set t_Co=16
set termencoding=utf-8
set encoding=utf-8
set foldlevel=1
set wildignore+=**/*.pyc

if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=0
    set cscopetag
    set nocscopeverbose
    if filereadable("cscope.out")
        cscope add cscope.out
    endif
    set cscopeverbose
    for key in ["s","g","c","t","e","d"]
        let cmd="cs find ".key." <C-R>=expand(\"<cword>\")<CR><CR>"
        exec "nmap <C-_>".key." :".cmd
        exec "nmap <C-Space>".key." :s".cmd
        exec "nmap <C-Space><C-Space>".key." :vert s".cmd
    endfor
endif
set number
highlight LineNr ctermfg=white ctermbg=darkgrey
