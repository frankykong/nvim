" Import Plugin "{{{
" ======================================================================

call plug#begin('~/AppData/Local/nvim/autoload/plugged')

  "Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

if has("nvim")

  "{{-- File management
  " for defx
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }         " 文件管理插件 
  
  " for telesocpe (file search)
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'                                      " telescope 依赖
  Plug 'nvim-telescope/telescope.nvim'                              " 神级文件模糊搜索插件telescope
  Plug 'hoob3rt/lualine.nvim'                                       " 状态栏
  "--}}

  "{{-- Language server system 
  " 系统自带LSP配置 LspInfo查看状况
  Plug 'neovim/nvim-lspconfig'                                      " 自动补全、语法检查
  Plug 'hrsh7th/cmp-nvim-lsp'                                       " 内置 LSP 客户端的 nvim-cmp 源
  Plug 'hrsh7th/cmp-buffer'                                         " 从buffer中智能提示
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'                " 添加jsx注释语法
  Plug 'hrsh7th/cmp-path'                                           " 自动提示硬盘上的文件
  Plug 'hrsh7th/nvim-cmp'                                           " 官方LSP核心
  Plug 'L3MON4D3/LuaSnip'                                           " 代码段提示
  
  " 基于CMP增强插件
  Plug 'onsails/lspkind-nvim'                                       " 美化自动完成提示信息
  Plug 'folke/lsp-colors.nvim'                                      " 配色方案
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }                " 基于neovim 内置lsp 的轻量级lsp 插件，具有高性能UI。非常酷
  Plug 'octaltree/cmp-look'                                         " 用于完成英语单词
  "--}}

  "{{-- Syntax system 
  " treesitter (高效的语法高亮支持)
  " 安装语言包的时候经常出现git无法连接或SSL验证失败的问题
  " 解决方案是设置 git proxy 并且确保https.sslverify=true,
  " http.sslcainfo地址要与git安装地址的cert.pem文件一致
  " 如果scoop安装的gcc出现Error during compilation报错，
  " 请尝试 choco install mingw，这个编译库非常全
  " Plug 'windwp/nvim-autopairs'
  " Plug 'windwp/nvim-ts-autotag'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }     " 通用高性能语法高亮插件
  " Plug 'JoosepAlviste/nvim-ts-context-commentstring'                " 添加jsx注释语法
  "--}}

  " for other stuff
  Plug 'dhruvasagar/vim-table-mode'                                 " table creator
  Plug 'mg979/vim-visual-multi'                                     " 列修改多个同名字符 
  Plug 'liuchengxu/vista.vim'                                       " 类似大纲功能
  Plug 'luochen1990/rainbow'                                        " 彩虹括号
  Plug 'tpope/vim-commentary'                                       " 注释工具 
  
  Plug 'leafOfTree/vim-matchtag'                                    " 匹配标签高亮

  " theme plug
  " Plug 'Mofiqul/vscode.nvim'
  Plug 'tanvirtin/monokai.nvim'
  " Plug 'christianchiarulli/nvcode-color-schemes.vim'              " 8 sub theme
  " Plug 'ful1e5/onedark.nvim'
  


endif
call plug#end()
"}}}



" Example config in VimScript
" configuration needs to be set BEFORE loading the color scheme with `colorscheme` command
" let g:onedark_function_style = "italic"
" let g:onedark_sidebars = ["qf", "vista_kind", "terminal", "packer"]
" " VimScript
" let g:onedark_highlight_linenumber = 1

" " Change the "hint" color to the "orange0" color, and make the "error" color bright red
" let g:onedark_colors = {
"   \ 'hint': 'orange0',
"   \ 'error': '#ff0000',
"   \ 'background': '#ff0'
" \ }

" colorscheme onedark



" Some simple plugin config put in here "{{{
" ---------------------------------------------------------------------------------------
" nerd-commentatolet g:vim_jsx_pretty_colorful_config = 1 " default 0r
" 因为这个插件的配置需要比较高的加载级别，所以在init.vim文件中增加下面一行
source ~/AppData/Local/nvim/after/plugin/rainbow.rc.vim
let g:rainbow_active = 1
"autocmd BufRead,BufNewFile *.mycjson set filetype=jsonc

" Theme settings {{{ https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
" ---------------------------------------------------------------------------------------
if exists("&termguicolors") && exists("&winblend")
  syntax enable                                                    " 开启语法高亮
  " checks if your terminal has 24-bit color support
  set termguicolors
  " set winblend=0
  " set wildoptions=puv
  " set pumblend=5
  " set background=dark
  " " Use NeoSolarized
  " let g:neosolarized_termtrans=1
  " runtime ./colors/NeoSolarized.vim
  " colorscheme NeoSolarized


  " Vim-Script:
  " let g:vscode_style = "darkv
  " let g:vscode_transparency = 1
  " let g:vscode_italic_comment = 1
  " let g:vscode_disable_nvimtree_bg = v:true ristretto
  " colorscheme vscode
  
  " monokai support jsx  monokai, monokai_pro, monokai_soda, monokai_ristretto
  colorscheme monokai

  " configure nvcode-color-schemes
  " let g:nvcode_termcolors=256
  " colorscheme nvcode " Or onedark nord aurora gruvbox palenight snazzy xoria 


endif
"}}}

lua <<EOF
require('monokai').setup {
   palette = {
        name = 'monokai',
        base1 = '#272a30',
        base2 = '#1e1e1e',
        base3 = '#2E323C',
        base4 = '#333842',
        base5 = '#4d5154',
        base6 = '#387834',
        base7 = '#b1b1b1',
        border = '#a1b5b1',
        brown = '#504945',
        white = '#b8bfb8',
        grey = '#8F908A',
        black = '#000000',
        pink = '#C285BF',
        green = '#96c930',
        aqua = '#A4DCFE',
        yellow = '#CA9178',
        orange = '#fd971f',
        purple = '#ae81ff',
        red = '#e95678',
        diff_add = '#3d5213',
        diff_remove = '#4a0f23',
        diff_change = '#27406b',
        diff_text = '#23324d',
    }
}

EOF

