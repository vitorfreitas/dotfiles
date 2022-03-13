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

" fzf
command! FzfListFiles execute (len(fugitive#head())) ? 'GFiles' : 'Files'
nmap ; :FzfListFiles<CR>
nmap <leader>; :Ag<CR>

" vim-better-whitespace
nmap <leader>y :StripWhitespace<CR>

" easy-motion
map <leader>w <Plug>(easymotion-bd-w)

" vimspector
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dbt :!tsc<CR> :call vimspector#Launch()<CR>
nnoremap <leader>db :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_t :!tsc<Cr> <Plug>VimspectorRestart
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

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
nnoremap gwq :wq<CR>
inoremap jk <Esc>

augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

" Reload icons after init source
if exists('g:loaded_webdevicons')
call webdevicons#refresh()
endif
