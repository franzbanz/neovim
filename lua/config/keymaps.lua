-- leader key
vim.g.mapleader = vim.keycode('<Space>')

-- clipboard interaction
vim.keymap.set({'n', 'x'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x'}, 'gp', '"+p', {desc = 'Paste clipboard text'})

-- shortcuts
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save file'})
vim.keymap.set('n', '<leader>q', '<cmd>quitall<cr>', {desc = 'Exit vim'})
vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', {desc = 'File explorer'})
vim.keymap.set('n', '<leader><space>', '<cmd>Pick buffers<cr>', {desc = 'Search open files'})
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', {desc = 'Search all files'})
vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<cr>', {desc = 'Search help tags'})
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode', silent = true })
vim.keymap.set('n', '<leader>1', function()
  require("mini.files").open({ cwd = vim.fn.expand('~/Documents/blog/src/notes') })
end, { noremap = true, silent = true, desc = "Open notes bookmark" })
vim.keymap.set('n', '<leader>2', function()
  require("mini.files").open({ cwd = vim.fn.expand('~/Documents') })
end, { noremap = true, silent = true, desc = "Open Documents" })
vim.keymap.set('n', '<leader>t', function()
  local file_path = vim.fn.expand('%:p')
  local file_dir = nil
  if file_path ~= '' and vim.fn.isdirectory(vim.fn.expand('%:p:h')) == 1 then
    file_dir = vim.fn.expand('%:p:h')
  else
    file_dir = vim.fn.getcwd()
  end
	vim.cmd('sp')
  vim.cmd('wincmd j')
  vim.cmd('resize -10')
	vim.cmd('term cd ' .. vim.fn.fnameescape(file_dir) .. ' && $SHELL')
	vim.cmd('startinsert')
end, { desc = 'Open small terminal split in file directory', silent = true })

