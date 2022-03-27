if !exists('g:loaded_cmp') | finish | endif

set completeopt=menuone,noinsert,noselect

lua <<EOF
  local cmp = require'cmp'
  -- local lspkind = require'lspkind'

  --   פּ ﯟ   some other good icons
  local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
  }

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
      -- ['<Tab>'] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.select_next_item()
      --   elseif require("luasnip").expand_or_jumpable() then
      --     require("luasnip").expand_or_jump()
      --   elseif has_words_before() then
      --     cmp.complete()
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" }),
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.select_prev_item()
      --   elseif require("luasnip").jumpable(-1) then
      --     require("luasnip").jump(-1)
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" }),
    },

    sources = {
      -- Youtube: Could enable this only for lua, but nvim_lua handles that already.
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer", keyword_length = 3 },
      { name = "treesitter" },
      { name = "path" },
      --{
      --  name = 'look'
      --  keyword_length = 2,
      --  option = {
      --      convert_case = true,
      --      loud = true
      --      --dict = '/usr/share/dict/words'
      --  }
      --},
    },

    -- sources = cmp.config.sources({
    --   { name = 'nvim_lsp' },
    --   { name = 'luasnip' },
    -- }, {
    --   { name = 'buffer' },
    --   { name = 'look', keyword_length = 2 },
    -- }),

    -- formatting = {
    --   fields = {"kind", "abbr", "menu"},
    --   format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    -- },


    formatting = {
      fields = {"kind", "abbr", "menu"},
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },

  })

  -- vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
EOF

