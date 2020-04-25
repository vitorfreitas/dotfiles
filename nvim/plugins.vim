" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" Editing
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rstacruz/vim-closer'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/argtextobj.vim'

" Languages and frameworks
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'mattn/emmet-vim'
Plug 'peitalin/vim-jsx-typescript'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" UI
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Completion and snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'

" Time management
Plug 'wakatime/vim-wakatime'

call plug#end()

