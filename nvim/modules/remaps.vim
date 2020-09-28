" ----- Used functions -----s
" --- Coc.nvim ---
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" ---------- Remaps ----------
" Removing arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" Print full path of current file
nnoremap <leader>pp 1<C-g>
" Moving lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Moving between panes
nnoremap <leader>h : wincmd h<CR>
nnoremap <leader>j : wincmd j<CR>
nnoremap <leader>k : wincmd k<CR>
nnoremap <leader>l : wincmd l<CR>
" Tools-toggles
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" Resizing
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
" ----- Fugitive remaps -----
nnoremap <silent> <leader>fh :diffget //2<CR>
nnoremap <silent> <leader>fl :diffget //3<CR>
" ----- Goyo & Limelight toggle -----
nnoremap <leader>m :Goyo <bar> :Limelight!! <bar> hi! Normal ctermbg=NONE guibg=NONE<CR>
" ----- Coc.nvim remaps -----
" Standard coc functionalities
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gp :call CocActionAsync('doHover')<CR>
nmap <silent> <leader>rn <Plug>(coc-rename)
" ----- Coc.nvim completion -----
" Trigger completion with <tab>
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Confirm completion with <CR>
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" ----- FZF/Rg remaps -----
nnoremap ff :Files<CR>
nnoremap fr :ProjectFiles<CR>
nnoremap <leader>rg :Find<CR>
