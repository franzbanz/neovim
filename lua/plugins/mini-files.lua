return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    require('mini.files').setup({
      mappings = { show_help = 'gh' },
    })
  end
}

