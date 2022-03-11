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
    "php",
    "json",
    "yaml",
    "html",
    "scss",
    "vim",
    "lua"
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
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
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

EOF

" comment keymap 还未解决react注释的问题
nnoremap <leader>c <cmd>lua require('ts_context_commentstring.internal').update_commentstring()<cr>

" TSInstall <language_to_install>        " Treesitter使用不同的解析器用于每一种语言。
" TSInstallInfo                           " 获取所有可用语言及其安装状态的列表


