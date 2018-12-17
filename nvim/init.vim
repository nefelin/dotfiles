
" set runtimepath^=~/.vim runtimepath+=~/.vim/fater
let &packpath = &runtimepath
set laststatus=2

call plug#begin('~/.config/nvim/plugged')

" tpope necessities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'mattn/emmet-vim'

" language-specific 
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

Plug 'flazz/vim-colorschemes'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' 

" Autocompletes
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'prettier/vim-prettier'

" Gutter Clutter
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'

Plug 'raimondi/delimitmate'

Plug  'yuttie/comfortable-motion.vim'

Plug  'kien/ctrlp.vim'

call plug#end()

" start vimrc
set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start " fix weird backspace problem

" Mark toggle mapping
nnoremap mm :SignatureToggleSigns<CR>

" Easier pane switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-s> <C-W>w

" Mouse scrolling + selection
set mouse=a
if !has('nvim')
	if has("mouse_sgr")
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	end
endif

" Wordwrap in quickfix BROKEN
augroup quickfix
	autocmd!
	autocmd FileType qf setlocal wrap
augroup END

" Emmet stuff
let g:user_emmet_install_global = 0
autocmd FileType html,css,js EmmetInstall

" Tabline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline_theme='kalisi'
let g:airline_theme='onedark'
"hi LineNR ctermbg=black
" set hidden allows tab switching without unsaved warning
set hidden

" comfortable motion mouse smoothing
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(20)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-20)<CR>

" vim-go stuff
let g:go_fmt_command = "goimports"

" Tab settings
set tabstop=3
set shiftwidth=3

set smartindent
syntax on
set t_Co=256
set path=$PWD/** " Allows find to work recursively

" context sensitive line numbers
augroup numbertoggle
 autocmd!
 autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
 autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set number

nnoremap - :RangerCurrentDirectory<CR>
nnoremap <buffer> <Leader>r :w<cr> :exec '!python3' shellescape(@%, 1)<cr>

let g:deoplete#enable_at_startup = 1
" remap tab for deoplete completions
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

color onehalfdark
set termguicolors

" per project rc
set exrc
set secure

if !has('nvim')
	function! RangeChooser()
		 let temp = tempname()
		 " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
		 " with ranger 1.4.2 through 1.5.0 instead.
		 "exec 'silent !ranger --choosefile=' . shellescape(temp)
		 if has("gui_running")
			  exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
		 else
			  exec 'silent !ranger --choosefiles=' . shellescape(temp)
		 endif
		 if !filereadable(temp)
			  redraw!
			  " Nothing to read.
			  return
		 endif
		 let names = readfile(temp)
		 if empty(names)
			  redraw!
			  " Nothing to open.
			  return
		 endif
		 " Edit the first item.
		 exec 'edit ' . fnameescape(names[0])
		 " Add any remaning items to the arg list/buffer list.
		 for name in names[1:]
			  exec 'argadd ' . fnameescape(name)
		 endfor
		 redraw!
	endfunction
	command! -bar RangerChooser call RangeChooser()
	nnoremap - :<C-U>RangerChooser<CR>
endif


