" Drop Vi compatibility
set nocompatible
filetype off

" {{ Plugins 

" VUNDLE {{{

    set rtp+=~/.config/vim-config/bundle/vundle

    call vundle#begin()

    " the path where Vundle should install plugins
    call vundle#begin('~/.config/vim-config/bundle/')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    " Keep them here for now
    " TODO: configure 
    Bundle 'scrooloose/nerdtree'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'
    Bundle 'ctrlpvim/ctrlp.vim'
    Bundle 'tacahiroy/ctrlp-funky'
    Bundle 'altercation/vim-colors-solarized'

    call vundle#end()            " required
" }}}
" }}

" Settings {{
"
    " General {{ 
        filetype plugin indent on " Detect file types
        syntax on
        set encoding=utf-8
        set mouse=a               " Allow mouse usage
        set virtualedit=onemore   " Allow the cursor to go beyod the last character
        set history=1000          " Store a lot of history
        set spell                 " Turn on the spellchecker
        set hidden                " Allow buffer switching without saving


        set noswapfile             " Disable swap files
        set undodir=~/.vim/undodir " Set the location of the undodir
        set undofile               " Turn persistent undo on
        set undolevels=1000        " Maximum number of changes to record
        set undoreload=10000       " Maximum number lines to save for undo on a buffer reload
    " }}

    " Appearance {{
        colorscheme solarized      " Colorscheme
        set background=dark        " Assume a dark background
        set nofoldenable           " Enable folding
        set number                 " Always show line numbers

        highlight clear SignColumn " SignColumn should match bg 
        highlight clear LineNr     " LineNr should match the bg 

        set colorcolumn=80         " Visual line limit
        set cursorline             " Highlight current line
        set ruler

        set wildmenu               " show list instead of just completing
        set laststatus=2           " Always display statusline

        set showmatch              " Show matching brackets
        set incsearch              " Find as you type search
        set hlsearch               " Highlight search terms

        " Highlight ugly whitespace {{
            set list
            set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
        " }}
    " }}

    " Search {{
        set hlsearch
        set smartcase
        set ignorecase
        set incsearch
    " }}
    
    " Scroll {{
        set scrolljump=5            " Lines to scroll when cursor leaves screen
        set scrolloff=3             " Keep 3 above or below cursor when scrolling
    " }}

    " Formating {{
        set nowrap
        set autoindent
        set expandtab
        set shiftwidth=4
        set smartindent
        set smarttab
        set softtabstop=4
    " }}
    
    " Misc {{
        set backspace=indent,eol,start
    " }}

    " Helper functions {{
         "TODO: move them to a new source file
         " Function toggles relative and absolute line numbering
        function! NumberToggle()
            if(&relativenumber == 1)
                set relativenumber!
                set number 
            else
                set relativenumber
            endif
        endfunc
        "=====================================================================
        " adjust configuration for such hostile environment as Windows {{{
        if has("win32") || has("win16")
            " windows specific stuff
        else
            " For when you forget to edit the file with su permissions
            cmap w!! w !sudo tee % >/dev/null
        endif
        " }}}
            " }}

    " Key remapping {{
            " Disable arrow keys {{
                " Normal
                map <Up> <NOP>
                map<Down> <NOP>
                map <Left> <NOP>
                map <Right> <NOP>
                " Insert
                imap <Up> <NOP>
                imap<Down> <NOP>
                imap <Left> <NOP>
                imap <Right> <NOP>
                " Visual
                vmap <Up> <NOP>
                vmap<Down> <NOP>
                vmap <Left> <NOP>
                vmap <Right> <NOP>
            " }}
    
            " Toggles absolute and relative line numer
            nnoremap <C-n> :call NumberToggle()<cr>

            " Lazier version (Esc is too far)
            inoremap jk <ESC>
            
            " Make < > shifts keep selection
            vnoremap < <gv
            vnoremap > >gv
            nnoremap / /\v
            vnoremap / /\v

            " Fixes common lazy shift typos 
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>

            " Yank from current cursor position to end of line
            map Y y$
            " Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
            vnoremap <leader>yo "*y
            " Paste content from OS's clipboard
            nnoremap <leader>po "*p
    " }}
" }}

