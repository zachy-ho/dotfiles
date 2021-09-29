" ----- Used functions -----s
" --- Coc.nvim ---
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" ---------- Remaps ----------
" Removing arrow keys
noremap <Up> <Nop>
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
" Print full path of current file
nnoremap <leader>pp 1<C-g>
" Copy path of current file
nnoremap <leader>cp :let @+= expand("%:p:h")<CR>
" Moving lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Creating splits
nnoremap <leader>wl : wincmd v<CR>
nnoremap <leader>wj : wincmd s<CR>
" Moving between panes
nnoremap <leader>h : wincmd h<CR>
nnoremap <leader>j : wincmd j<CR>
nnoremap <leader>k : wincmd k<CR>
nnoremap <leader>l : wincmd l<CR>
" Moving panes
nnoremap <leader>H : wincmd H<CR>
nnoremap <leader>J : wincmd J<CR>
nnoremap <leader>K : wincmd K<CR>
nnoremap <leader>L : wincmd L<CR>
nnoremap <leader>x : wincmd x<CR>
" Vim tabs
noremap <leader>ct :tabclose
nnoremap <leader>ot :tabnew
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
nmap <silent> <leader>gd :call CocAction('jumpDefinition')<CR>
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi :call CocAction('jumpImplementation')<CR>
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gp <Plug>(coc-action-doHover)
nmap <silent> <leader>rn <Plug>(coc-rename)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
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
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :ProjectFiles<CR>
nmap <leader>fr <Space>cp <bar> :Files
nnoremap <leader>rg :Find<CR>

" Source init.vim
nnoremap <leader>rsn :source $HOME/.config/nvim/init.vim<CR>
