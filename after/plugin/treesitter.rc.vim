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
      scope_incremental = "W",
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
  playground = {
    enable = true,
    -- disable = {},
    -- updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    -- persist_queries = false, -- Whether the query persists across vim sessions
    -- keybindings = {
    --   toggle_query_editor = 'o',
    --   toggle_hl_groups = 'i',
    --   toggle_injected_languages = 't',
    --   toggle_anonymous_nodes = 'a',
    --   toggle_language_display = 'I',
    --   focus_language = 'f',
    --   unfocus_language = 'F',
    --   update = 'R',
    --   goto_node = '<cr>',
    --   show_help = '?',
    -- },
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    -- highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["]b"] = "@function.outer",
        ["]n"] = "@function.inner",
        ["<leader>co"] = "@class.outer",
        ["<leader>ci"] = "@class.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
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

" TSInstall <language_to_install>        " Treesitter????????????????????????????????????????????????
" TSInstallInfo                           " ???????????????????????????????????????????????????


