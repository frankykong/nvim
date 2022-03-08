" https://linux.cn/article-10039-1.html

" init autocmd
autocmd!
" set script encoding
set encoding=utf-8
set fileencodings=ucs-bom,UTF-8,GBK,BIG5,latin1 
" stop loading config if it's on tiny or small
if !1 | finish | endif

" Visual
set nocompatible      " 非兼容模式
syntax enable         " 开启语法高亮

set fileformat=unix   " 换行使用unix方式 
set number
set title
set showmatch         " 高亮标识匹配的括号
set background=dark
set showcmd           " 在状态栏显示命令  
"set cmdheight=1
set nowrap "No Wrap lines " No Wrap lines
if has('nvim')
  set inccommand=split  " 
endif

" Indentation & Tabs
set autoindent        " 自动缩进
set smartindent       " 智能缩进
set expandtab 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=2       " 退格键可以删除任何东西
"set foldmarker={,}    " 缩进符号 
"set foldmethod=indent " 缩进作为折叠标识  
set smarttab          " Be smart when using tabs ;)

" Search
set hlsearch          " 高亮搜索内容的所有匹配位置
set smartcase         " 搜索内容包含部分大写字符时，要使搜索大小写敏感
set ignorecase        " 搜索时忽略大小写

" Browse & Scroll
set scrolloff=5       " 使光标距窗口上下保留 5 行
set laststatus=2      " 窗口底部显示一个永久状态栏，可以显示文件名、行号和列号等内容

" Miscellaneous
set notimeout
set nobackup          " 禁止创建备份文件
set noswapfile        " 禁止创建交换文件
set autochdir         " 将工作目录自动切换到正在编辑的文件
set lazyredraw        " 延迟重绘增加效率
set formatoptions+=r  " Add asterisks in block comments

" Spell
set spell spelllang=en_us " 英语拼写检查

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}


" Import Plugin "{{{
" ======================================================================

call plug#begin('~/AppData/Local/nvim/autoload/plugged')

  "Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
endif
  
call plug#end()
"}}}


" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}


" Syntax theme "{{{
" ---------------------------------------------------------------------
" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif


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
