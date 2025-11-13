return {
  'nvim-mini/mini-git',
  version = '*',
  config = function()
    require('mini.git').setup({
      signs = { add = '+', change = '~', delete = '-' },
    })
  end
}

