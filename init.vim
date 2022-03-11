" https://linux.cn/article-10039-1.html
" https://blog.csdn.net/lxyoucan/article/details/120641546

" init autocmd
autocmd!
" set script encoding
set encoding=utf-8
set fileencodings=ucs-bom,UTF-8,GBK,BIG5,latin1 
" stop loading config if it's on tiny or small
if !1 | finish | endif
set nocompatible      " 非兼容模式

" Visual
set mouse=a           " 使用鼠标 a/c
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
"set autochdir         " 将工作目录自动切换到正在编辑的文件
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


" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    " Description: macOS-specific configs
    " Use OSX clipboard to copy and to paste
    set clipboard+=unnamedplus
    " Copy selected text in visual mode
    "set clipboard+=autoselect
  endif
endif
if has('win32')
  " Use Windows clipboard to copy and to paste
  set clipboard^=unnamed,unnamedplus
endif

runtime ./keymaps.vim
"}}}

" Theme settings
if exists("&termguicolors") && exists("&winblend")
  syntax enable                                                    " 开启语法高亮
  set termguicolors                                                " enable true colors support
  "set winblend=0
  "set wildoptions=pum
  "set pumblend=5
  "set background=dark

  " theme NeoSolarized
  "Use NeoSolarized
  "let g:neosolarized_termtrans=1
  "runtime ./colors/NeoSolarized.vim
  "colorscheme NeoSolarized

  " theme ayu
  "let ayucolor="mirage"   " for dark version of theme
  "colorscheme ayu

  " theme ayu dark
  "set termguicolors     " enable true colors support
  "let ayucolor="light"  " for light version of theme
  "let ayucolor="mirage" " for mirage version of theme
  "let ayucolor="dark"   " for dark version of theme
  "let ayucolor="darker" " for darker version of theme
  "colorscheme ayu
  "let g:indentLine_char = ''
  "let g:indentLine_first_char = ''
  "let g:indentLine_showFirstIndentLevel = 1
  "let g:indentLine_setColors = 0

  " theme bloop
  "set termguicolors
  "let g:bloop_use_italics = 0
  "let g:bloop_use_italics = 0
  "colorscheme bloop

  "set colorscheme = 'github'

  "colorscheme xcodedark
  "colorscheme xcodedarkhc

  "runtime ./colors/alduin.vim
  "let g:alduin_Shout_Fire_Breath = 1
  "let g:alduin_Shout_Become_Ethereal = 1
  "let g:alduin_Shout_Aura_Whisper = 1
  "colorscheme alduin


  "runtime ./colors/kolor.vim
  "colorscheme kolor

  " Vim-Script:
  " For dark theme
  let g:vscode_style = "dark"
  " Enable transparent background.
  let g:vscode_transparency = 1
  " Enable italic comment
  let g:vscode_italic_comment = 1
  " Disable nvim-tree background color 
  let g:vscode_disable_nvimtree_bg = v:true 
  colorscheme vscode


endif


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


