local map = vim.keymap.set

-- clipboard
map({'n', 'x'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
map({'n', 'x'}, 'gp', '"+p', {desc = 'Paste from clipboard'})

-- shortcuts
map('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save file'})
map('n', '<leader>q', '<cmd>quitall<cr>', {desc = 'Exit vim'})
map('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode', silent = true })

-- file explorer and picker
map('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', {desc = 'File explorer'})
map('n', '<leader><space>', '<cmd>Pick buffers<cr>', {desc = 'Search open files'})
map('n', '<leader>ff', '<cmd>Pick files<cr>', {desc = 'Search all files'})
map('n', '<leader>fh', '<cmd>Pick help<cr>', {desc = 'Search help tags'})

-- bookmarks
map('n', '<leader>1', function()
  require("mini.files").open(vim.fn.expand('~/Documents/blog/src/notes'))
end, { noremap = true, silent = true, desc = "Open notes bookmark" })

map('n', '<leader>2', function()
  require("mini.files").open(vim.fn.expand('~/Documents'))
end, { noremap = true, silent = true, desc = "Open Documents" })

-- small terminal
map('n', '<leader>t', function()
  local file_path = vim.fn.expand('%:p')
  local file_dir = (file_path ~= '' and vim.fn.isdirectory(vim.fn.expand('%:p:h')) == 1)
      and vim.fn.expand('%:p:h') or vim.fn.getcwd()

  vim.cmd('sp')
  vim.cmd('wincmd j')
  vim.cmd('resize -10')
  vim.cmd('term cd ' .. vim.fn.fnameescape(file_dir) .. ' && $SHELL')
  vim.cmd('startinsert')
end, { desc = 'Open small terminal split in file directory', silent = true })

