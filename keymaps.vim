" Key map "{{{
" :h key-notation
" ---------------------------------------------------------------------
let mapleader=" "
" inoremap kj <Esc>
" cnoremap kj <C-C>

nnoremap <c-z> :u<CR>             " Avoid using this**
inoremap <c-z> <c-o>:u<CR>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Resize window
"nmap <C-w><left> <C-w><
"nmap <C-w><right> <C-w>>
"nmap <C-w><up> <C-w>+
"nmap <C-w><down> <C-w>-

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Save and quite
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nmap <C-q> :q<CR>
nnoremap q <C-q>
nnoremap <C-q> :q<CR>
map <C-c> yyp   

" Movement
nnoremap <A-h> b
nnoremap <A-l> e
nnoremap <A-j> 5j
vnoremap <A-j> 5j
nnoremap <A-k> 5k
vnoremap <A-k> 5k
nnoremap <C-h> <Home>
nnoremap <C-l> <End>
nnoremap <Enter> i<Enter><Esc>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-h> <Left>
inoremap <A-l> <Right>
inoremap <C-h> <C-Left>
inoremap <C-l> <C-Right>
inoremap <C-k> <Home>
inoremap <C-j> <End>

" Indent 
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
nnoremap <Bs> <S-j>
" Select
nnoremap v <S-v>
nnoremap <S-v> v
" Select all
nnoremap <C-a> gg<S-v>G
" Treesitter increment selection

" thank you for you help

nnoremap <leader>rv :source $MYVIMRC<CR>
"}}}

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
