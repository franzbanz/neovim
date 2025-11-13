return {
  'bullets-vim/bullets.vim',
  init = function()
    vim.g.bullets_set_mappings = 0
    vim.g.bullets_custom_mappings = {
      { 'imap', '<CR>', '<Plug>(bullets-newline)' },
      { 'inoremap', '<C-CR>', '<CR>' },
      { 'nmap', 'o', '<Plug>(bullets-newline)' },
      { 'vmap', 'gN', '<Plug>(bullets-renumber)' },
      { 'nmap', 'gN', '<Plug>(bullets-renumber)' },
      { 'nmap', '<leader>x', '<Plug>(bullets-toggle-checkbox)' },
      { 'imap', '<Tab>', '<Plug>(bullets-demote)' },
      { 'nmap', '<Tab>', '<Plug>(bullets-demote)' },
      { 'vmap', '<Tab>', '<Plug>(bullets-demote)' },
      { 'imap', '<S-Tab>', '<Plug>(bullets-promote)' },
      { 'nmap', '<S-Tab>', '<Plug>(bullets-promote)' },
      { 'vmap', '<S-Tab>', '<Plug>(bullets-promote)' },
    }
  end,
}
