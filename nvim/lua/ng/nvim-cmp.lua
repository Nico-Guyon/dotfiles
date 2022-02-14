-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  expand = function(args)
    -- For `vsnip` user.
    vim.fn["vsnip#anonymous"](args.body)

    -- For `luasnip` user.
    -- require('luasnip').lsp_expand(args.body)

    -- For `ultisnips` user.
    -- vim.fn["UltiSnips#Anon"](args.body)
  end,
},
mapping = {
  ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
},
sources = {
  { name = 'nvim_lsp' },

  -- For vsnip user.
  { name = 'vsnip' },

  -- For luasnip user.
  -- { name = 'luasnip' },

  -- For ultisnips user.
  -- { name = 'ultisnips' },

  { name = 'buffer' },

  { name = 'copilot' }
},
formatting = {
  format = function(entry, vim_item)

    if entry.source.name == 'copilot' then
      vim_item.kind = '[CO]'
    end

    return vim_item
  end
},
})

-- Setup lspconfig.
--require('lspconfig').tsserver.setup {
--  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--  }
