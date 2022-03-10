" Key map "{{{
" ---------------------------------------------------------------------
nnoremap <LEADER>e :NERDTreeToggle<CR>
inoremap kj <esc>
cnoremap kj <C-C>

nnoremap <c-z> :u<CR>             " Avoid using this**
inoremap <c-z> <c-o>:u<CR>

xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

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


" Select all
nmap <C-a> gg<S-v>G

nmap <A-j> 5j
nmap <A-k> 5k
nmap q <C-q>
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
