if !exists('g:loaded_cmp') | finish | endif

set completeopt=menuone,noinsert,noselect

lua <<EOF
  local cmp = require'cmp'
  local lspkind = require'lspkind'

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
      {
        name = 'look',
        keyword_length = 2,
        option = {
            convert_case = true,
            loud = true
            --dict = '/usr/share/dict/words'
        }
      }
    },

    -- sources = cmp.config.sources({
    --   { name = 'nvim_lsp' },
    --   { name = 'luasnip' },
    -- }, {
    --   { name = 'buffer' },
    --   { name = 'look', keyword_length = 2 },
    -- }),

    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    }
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
EOF

