local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      -- You can add snippet expansion later if needed
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'omni' },
  }),
})

-- Enable only for LaTeX files
cmp.setup.filetype('tex', {
  sources = cmp.config.sources({
    { name = 'omni' },
  }),
})

