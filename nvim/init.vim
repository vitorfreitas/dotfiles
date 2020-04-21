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

" UI
set numberwidth=5
set termguicolors
syntax on
colorscheme gruvbox

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

autocmd CursorHold * silent call CocActionAsync('highlight')

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"

" NERDTree
let NERDTreeShowLineNumbers=1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType nerdtree setlocal relativenumber
nnoremap <leader>n :NERDTreeToggle<CR>

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
nmap ; :Files<CR>
nmap <leader>; :Ag<CR>

" vim-better-whitespace
nmap <leader>y :StripWhitespace<CR>

" easy-motion
map <leader>w <Plug>(easymotion-bd-w)

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

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b

" Colors
hi Search guibg=lightblue guifg=black
hi StatusLine guibg=#ffcc40 guifg=Black ctermbg=46 ctermfg=0

" Reload icons after init source
if exists('g:loaded_webdevicons')
call webdevicons#refresh()
endif