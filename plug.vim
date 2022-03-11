
" Import Plugin "{{{
" ======================================================================

call plug#begin('~/AppData/Local/nvim/autoload/plugged')

  "Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

if has("nvim")
 
  " for file manage
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }         " 文件管理插件 
  
  " for telesocpe (file search)
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'                                      " telescope 依赖
  Plug 'nvim-telescope/telescope.nvim'                              " 神级文件模糊搜索插件telescope
  Plug 'hoob3rt/lualine.nvim'                                       " 状态栏

  " 系统自带LSP配置
  Plug 'neovim/nvim-lspconfig'                                      " 自动补全、语法检查
  Plug 'hrsh7th/cmp-nvim-lsp'                                       " 内置 LSP 客户端的 nvim-cmp 源
  Plug 'hrsh7th/cmp-buffer'                                         " 从buffer中智能提示
  Plug 'hrsh7th/cmp-path'                                           " 自动提示硬盘上的文件
  Plug 'hrsh7th/nvim-cmp'                                           " 官方LSP核心
  Plug 'L3MON4D3/LuaSnip'                                           " 代码段提示
  
  " 基于CMP增强插件
  Plug 'onsails/lspkind-nvim'                                       " 美化自动完成提示信息
  Plug 'folke/lsp-colors.nvim'                                      " 配色方案
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }                " 基于neovim 内置lsp 的轻量级lsp 插件，具有高性能UI。非常酷
  Plug 'octaltree/cmp-look'                                         " 用于完成英语单词

  " treesitter (高效的语法高亮支持)
  " 安装语言包的时候经常出现git无法连接或SSL验证失败的问题
  " 解决方案是设置 git proxy 并且确保https.sslverify=true,
  " http.sslcainfo地址要与git安装地址的cert.pem文件一致
  " 如果scoop安装的gcc出现Error during compilation报错，
  " 请尝试 choco install mingw，这个编译库非常全
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }     " 通用高性能语法高亮插件

  " 需要tresitter支持
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'                " javascript 注释工具

  " for coc(basic on nodejs server)
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'kevinoid/vim-jsonc'

  " for other stuff
  Plug 'dhruvasagar/vim-table-mode'                                 " An awesome automatic table creator
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}               " 列修改多个同名字符 
  Plug 'liuchengxu/vista.vim'                                       " 类似大纲功能
  Plug 'luochen1990/rainbow'                                        " 彩虹括号
  "Plug 'folke/which-key.nvim'                                       " displays a popup with possible key bindings
  "Plug 'preservim/nerdcommenter'                                    " commont tool
  
  Plug 'leafOfTree/vim-matchtag'


  " theme plug
  "Plug 'ayu-theme/ayu-vim'                                         " theme ayu
  "Plug 'nocksock/bloop-vim'
  "Plug 'k4yt3x/ayu-vim-darker'
  "Plug '1612492/github.vim'
  "Plug 'arzg/vim-colors-xcode'
  Plug 'Mofiqul/vscode.nvim'

endif
call plug#end()
"}}}

" Some simple plugin config put in here "{{{
" ---------------------------------------------------------------------------------------
" nerd-commentatolet g:vim_jsx_pretty_colorful_config = 1 " default 0r
" 因为这个插件的配置需要比较高的加载级别，所以在init.vim文件中增加下面一行
source ~/AppData/Local/nvim/after/plugin/rainbow.rc.vim
let g:rainbow_active = 1
"autocmd BufRead,BufNewFile *.mycjson set filetype=jsonc

" for leafOfTree/vim-matchtag
let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp'
