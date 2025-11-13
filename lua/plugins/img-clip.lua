return {
  'HakonHarnes/img-clip.nvim',
  event = 'VeryLazy',
  config = function()
    require('config.imgclip').setup()
  end,
}
