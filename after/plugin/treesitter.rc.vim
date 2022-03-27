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
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["9o"] = "@function.outer",
        ["9i"] = "@function.inner",
        ["<leader>co"] = "@class.outer",
        ["<leader>ci"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>po"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>pi"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]]"] = "@function.outer",
        ["]m"] = "@class.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
        ["]M"] = "@class.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
        ["[m"] = "@class.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
        ["[M"] = "@class.outer",
      },
    },
  },
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


