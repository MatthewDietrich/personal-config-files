"""""""""""""""""""""""""""""""
" System
"""""""""""""""""""""""""""""""
    " Disable vi compatibility mode
        set nocompatible

    " Use UTF-8 encoding
        set encoding=utf-8

    " Use filetype plugin
        filetype plugin indent on

    " Turn on recursive file search
        set path +=**

    " Automatically change directory
        set autochdir

    " Disable bell
        set noerrorbells visualbell t_vb=
        autocmd GUIEnter * set visualbell t_vb=

    " Use Pathogen package manager
        call pathogen#infect()

"""""""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""""""
    " Color scheme
        color industry

    " Use hybrid line numbers
        set number relativenumber
        set nu rnu

    " Enable code folding
        set foldmethod=indent
        set foldlevel=99

    " Enable visual autocomplete for vim menu
        set wildmenu

    " netrw stuff
        let g:netrw_liststyle=3
        let g:netrw_banner=0
        "let g:netrw_browse_split=4
        let g:netrw_altv=1
        "let g:netrw_list_hide=netrw_gitignore#Hide()
        let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+' " Change to .= if uncommenting above line
        let g:netrw_winsize = -28

    " Disable mouse
        set mouse=

    " Search as characters are entered, and highlight search results
        set incsearch
        set hlsearch

    " Highlight matching brackets
        set showmatch

    " Use custom font
        set guifont=Cousine:h12

    " Highlight ideal line end point
        set colorcolumn=80

    " Do not show menu bar, toolbar. or scrollbar in GUI mode
        if has("gui_running")
          set guioptions -=m
          set guioptions -=T
          set guioptions -=r
          set guioptions -=L
        endif

    " Style vertical split
        set fillchars+=vert:║

    " Show line and column numbers in status bar
        set ruler


"""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""

    " Enable syntax highlighting
        syntax on

    " Enable python-specific syntax highlighting
        let python_highlight_all=1

    " Use 4 spaces instead of tabs
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4
        set expandtab
        set shiftround

    " Use PEP 8 indentation
    "    au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=dos

    " Allow backspacing over anything
        set backspace=indent,eol,start

    " Use auto-indent
        set autoindent

    " Use special indent for braces on CTRL-Enter
    " https://stackoverflow.com/questions/4477031/vim-auto-indent-with-newline
        inoremap <C-Return> <CR><CR><C-o>k<Tab>


"""""""""""""""""""""""""""""""
" Custom functions
"""""""""""""""""""""""""""""""
    function! StripTrailingWhitespace()
        let _s = @/
        let l = line(".")
        let c = col(".")

        %s/\s\+$//e

        let @/=_s
        call cursor(l, c)
    endfunction


"""""""""""""""""""""""""""""""
" Key bindings
"""""""""""""""""""""""""""""""
    " Disable arrow key movement. Echo hint when arrow key is pressed.
        " Normal mode
            nnoremap <Up> :echoe "use <k> to move up instead" <CR>
            nnoremap <Down> :echoe "use <j> to move down instead" <CR>
            nnoremap <Left> :echoe "use <h> to move left instead" <CR>
            nnoremap <Right> :echoe "use <l> to move right instead" <CR>

        " Insert mode
            inoremap <Up> <nop>
            inoremap <Down> <nop>
            inoremap <Left> <nop>
            inoremap <Right> <nop>

        " Visual mode
            vnoremap <Up> :echoe "use <k> to move up instead" <CR>
            vnoremap <Down> :echoe "use <j> to move down instead" <CR>
            vnoremap <Left> :echoe "use <h> to move left instead" <CR>
            vnoremap <Right> :echoe "use <l> to move right instead" <CR>

    " Navigate splits with ; + navigation keys
        nnoremap ;j <C-W><C-J>
        nnoremap ;k <C-W><C-K>
        nnoremap ;l <C-W><C-L>
        nnoremap ;h <C-W><C-H>

    " Resize splits with ; + O/P
        nnoremap ;o <C-W><
        nnoremap ;p <C-W>>

    " Create split with ; + s
        nnoremap ;s :vsp<CR>
        nnoremap ;S :sp<CR>

    " Map F6 to no highlight
        nnoremap <F6> :noh <CR>

    " Use gV to highlight last block of characters inserted with insert mode
        nnoremap gV `[v`]

    " Tabs
    " https://medium.com/@hql287/10-vim-tips-to-ease-the-learning-curve-c8234cbdafa5
        nnoremap <Leader>1 1gt
        nnoremap <Leader>2 2gt
        nnoremap <Leader>3 3gt
        nnoremap <Leader>4 4gt
        nnoremap <Leader>5 5gt
        nnoremap <Leader>6 6gt
        nnoremap <Leader>7 7gt
        nnoremap <Leader>8 8gt
        nnoremap <Leader>9 9gt

        noremap <Leader>tN :tabnew<CR>
        noremap <Leader>tc :tabclose<CR>
        noremap <Leader>tm :tabmove<CR>
        noremap <Leader>tn :tabnext<CR>
        noremap <Leader>tp :tabprevious<CR>

    " Source .vimrc
        nnoremap <Leader>r :so $MYVIMRC<CR>
        nnoremap <Leader>R :windo execute "so $MYVIMRC"<CR>

    " Select all
        nnoremap <Leader>a ggVG

    cnoreabbrev mdw :silent !py -m markdown % > %.html

    nnoremap <Leader>u g~l

"""""""""""""""""""""""""""""""
" Autogroups
"""""""""""""""""""""""""""""""
    augroup configgroup
        autocmd!
        autocmd BufWritePre * :call StripTrailingWhitespace()
        autocmd BufNewFile,BufRead .apxc,.apxt set syntax=apex
        autocmd BufEnter,BufNewFile,BufRead .md set syntax=markdown,shiftwidth=2,softtabstop=2
        autocmd GUIEnter * simalt ~x " Start maximized
    augroup END


" Change color of status line. This only works when it's down here for some reason.
hi StatusLine ctermbg=black ctermfg=cyan guifg=#222222 guibg=cyan
hi StatusLineNC ctermbg=black ctermfg=cyan guifg=#222222 guibg=cyan
hi colorcolumn guibg=#222222
hi Vertsplit guifg=#222222 guibg=cyan
hi LineNr guibg=#222222 guifg=cyan
hi CursorLineNr guibg=#222222 guifg=white
hi NonText guibg=black guifg=#6A6A6A
