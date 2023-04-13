scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" EDITTING
let g:mapleader=','
set number
set relativenumber
set clipboard=unnamedplus
set nowrap
set scrolloff=3
set textwidth=80
set colorcolumn=+1
set foldmethod=indent
set foldlevelstart=20

" UI
set numberwidth=5
set termguicolors
set background=dark
set t_Co=256
syntax on
colorscheme gruvbox

" COLORS
highlight! Normal ctermbg=NONE guibg=NONE
highlight! LineNr ctermfg=NONE guibg=NONE
highlight! SignColumn ctermfg=NONE guibg=NONE
highlight! StatusLineNC guifg=#16252b guibg=#16252b
highlight! Search guibg=lightblue guifg=#777777
highlight! StatusLine guibg=#ffcc40 guifg=Black ctermbg=46 ctermfg=0

" TABS
set expandtab
set softtabstop=2
set shiftwidth=2

" COMPLETITION
set shortmess-=S

" OTHERS
set lazyredraw
set ignorecase
set smartcase

" lightline.vim
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }

" obvious resize
let g:obvious_resize_default = 2
nnoremap <silent> <A-h> :<C-U>ObviousResizeLeft<CR>
nnoremap <silent> <A-j> :<C-U>ObviousResizeDown<CR>
nnoremap <silent> <A-k> :<C-U>ObviousResizeUp<CR>
nnoremap <silent> <A-l> :<C-U>ObviousResizeRight<CR>

" signify
let g:signify_sign_delete = '-'
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE
hi! SignifySignAdd guifg=#99c794
hi! SignifySignDelete guifg=#ec5f67
hi! SignifySignChange guifg=#c594c5

" fzf
command! FzfListFiles execute (len(fugitive#head())) ? 'GFiles' : 'Files'
nmap ; :Files<CR>
nmap <leader>; :Ag<CR>

" Fugitive
nnoremap <Leader>gd :Gvdiff<cr>
nnoremap <Leader>gs :Git status<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>ga :Git add<cr>
nnoremap <Leader>gb :Git blame<cr>
nnoremap <Leader>gc :Git commit<cr>
nnoremap <Leader>ge :Gedit<cr>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>grm :Gremove<cr>
nnoremap <Leader>gp :Git push
nnoremap <Leader>gl :Gclog<cr>

" Nerdtree
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>

" Mappings
nnoremap <leader><space> :nohlsearch<CR>
noremap H 0^
noremap L $
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap gq :q<CR>

augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

" Reload icons after init source
if exists('g:loaded_webdevicons')
call webdevicons#refresh()
endif
