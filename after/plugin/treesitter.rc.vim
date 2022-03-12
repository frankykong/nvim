if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "javascript",
    "json",
    "yaml",
    "html",
    "scss",
    "vim",
    "lua",
    "php",
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    config = {
      css = '// %s',
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      },
      typescript = { 
        __default = '// %s',
        __multiline = '/* %s */' 
      }
    }
  },
  incremental_selection = {
    enable = true,
    keymaps ={
      init_selection = "w",
      node_incremental = "<C-w>",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

EOF

" You can either configure curl to use additional CLI arguments in your Lua config:
"require("nvim-treesitter.install").command_extra_args = {
"    curl = { "--proxy", "<proxy url>" },
"}
"
" or you can configure git via .gitconfig and use git instead of curl
"require("nvim-treesitter.install").prefer_git = true

" TSInstall <language_to_install>        " Treesitter使用不同的解析器用于每一种语言。
" TSInstallInfo                           " 获取所有可用语言及其安装状态的列表


