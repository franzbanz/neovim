-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg'},
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	spec = {
		{ 'nvim-mini/mini.nvim', version = false, config = function()
			require('mini.git').setup({signs = { add = '+', change = '~', delete = '-' },})
			require('mini.diff').setup({view = { style = 'sign' },})
			require('mini.pairs').setup({})
			require('mini.statusline').setup({})
			require('mini.icons').setup({})
			require('mini.cursorword').setup({})
			require('mini.files').setup({mappings = {show_help = 'gh',},})
			require('mini.pick').setup({options = {use_cache = true,content_from_register = false,},})
		end
	},
	{
  	"max397574/better-escape.nvim",
  	config = function()
    	require("better_escape").setup()
  	end,
	},
	{
  	"nvim-treesitter/nvim-treesitter",
  	build = ":TSUpdate",
  	config = function()
    	require("nvim-treesitter.configs").setup({
      	ensure_installed = { "markdown", "markdown_inline", "latex" },
      	auto_install = true,
      	highlight = {
        	enable = true,
        	additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	  {
    	"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			config = function()
				require("config.imgclip").setup()
			end,
		},
		{			
			'git@github.com:lucasprag/simpleblack.git',
			config = function()
				vim.cmd.colorscheme('simpleblack')
			end,
		},
  },
	install = { colorscheme = { 'simpleblack' } },
  checker = { enabled = true },
})

