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
nnoremap <silent> <Left>  :<C-U>ObviousResizeLeft<CR>
nnoremap <silent> <Down>  :<C-U>ObviousResizeDown<CR>
nnoremap <silent> <Up>    :<C-U>ObviousResizeUp<CR>
nnoremap <silent> <Right> :<C-U>ObviousResizeRight<CR>

" coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <C-x> <C-o> coc#refresh()

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"

" NERDTree
let NERDTreeShowLineNumbers=1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType nerdtree setlocal relativenumber
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" signify
let g:signify_sign_delete = '-'
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE
hi! SignifySignAdd guifg=#99c794
hi! SignifySignDelete guifg=#ec5f67
hi! SignifySignChange guifg=#c594c5

" vim-jsx
let g:jsx_ext_required = 0

" vim-vue
let g:vue_pre_processors = ['sass']

" fzf
command! FzfListFiles execute (len(fugitive#head())) ? 'GFiles' : 'Files'
nmap ; :FzfListFiles<CR>
nmap <leader>; :Ag<CR>

" vim-better-whitespace
nmap <leader>y :StripWhitespace<CR>

" easy-motion
map <leader>w <Plug>(easymotion-bd-w)

" Fugitive
nnoremap <Leader>gd :Gvdiff<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>ga :Git add<cr>
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>ge :Gedit<cr>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gr :Gread<cr>
nnoremap <Leader>grm :Gremove<cr>
nnoremap <Leader>gp :Git push
nnoremap <Leader>gl :0Glog<cr>

" Mappings
map <leader>h :%s///<left><left>
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

" Reload icons after init source
if exists('g:loaded_webdevicons')
call webdevicons#refresh()
endif
