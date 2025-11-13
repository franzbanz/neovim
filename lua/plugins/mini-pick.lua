return {
  'echasnovski/mini.pick',
  version = '*',
  config = function()
    require('mini.pick').setup({
      options = { use_cache = true, content_from_register = false },
    })
  end
}

