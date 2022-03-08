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
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "html",
    "scss"
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF

" TSInstall <language_to_install>        " Treesitter使用不同的解析器用于每一种语言。
" TSInstallInfo                           " 获取所有可用语言及其安装状态的列表


