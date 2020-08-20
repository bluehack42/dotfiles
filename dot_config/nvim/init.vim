if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  execute 'sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim''
endif

call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'majutsushi/tagbar'
call plug#end()

set number
set relativenumber
set syntax
set ignorecase
set smartcase
set noexpandtab           " Insert spaces when TAB is pressed.
"set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2
set list listchars=eol:┐
" set expandtab                   " Convert tabs into spaces
" set list
" " set listchars=tab:>\ ,trail:·,extends:\#,nbsp:.
" set shiftwidth=2  " width for autoindents
" set smarttab      " Make <tab> and <backspace> smarter
" set colorcolumn=121

highlight ColorColumn ctermbg=3

:imap § <Esc>

nmap <C-n> :NERDTreeToggle<CR>

"
""""""""
" Keys "
""""""""

function! ColorColumnToggle()
    if &colorcolumn == 81
        set colorcolumn=121
        echo 'Column: 120'
    elseif &colorcolumn == 121
        set colorcolumn=0
        echo 'Column: OFF'
    else
        set colorcolumn=81
        echo 'Column:  80'
    endif
endfunction

nnoremap <F2> :call ColorColumnToggle()<CR>

" settings for fileTypes

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=2 softtabstop=0

let g:deoplete#enable_at_startup = 1

autocmd VimEnter * nested :TagbarOpen 
