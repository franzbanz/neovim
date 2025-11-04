require('config.lazy')
require('config.keymaps')
require('config.imgclip').setup({})

-- config
vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.signcolumn = 'yes'
vim.o.laststatus = 3
vim.o.showmode = false
vim.o.autochdir = true

-- set python env
vim.g.python3_host_prog = '~/.local/share/nvim-venv/bin/python'

