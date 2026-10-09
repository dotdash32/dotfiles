vim.pack.add{
  { src = 'https://github.com/smart-splits-nvim/smart-splits.nvim' , name = 'smart-splits', },
  { src = 'https://github.com/smart-splits-nvim/backend-tmux', name = 'smart-splits-backend-tmux' },
}

require('smart-splits-backend-tmux').setup()

require('smart-splits').setup({
  mux = {
    backend = 'smart-splits-backend-tmux',
  },
})

local ss = require("smart-splits")

-- move around panes
vim.keymap.set("n", "<C-h>", ss.move_cursor_left)
vim.keymap.set("n", "<C-j>", ss.move_cursor_down)
vim.keymap.set("n", "<C-k>", ss.move_cursor_up)
vim.keymap.set("n", "<C-l>", ss.move_cursor_right)

-- resizing
vim.keymap.set('n', '<A-C-h>', ss.resize_left)
vim.keymap.set('n', '<A-C-j>', ss.resize_down)
vim.keymap.set('n', '<A-C-k>', ss.resize_up)
vim.keymap.set('n', '<A-C-l>', ss.resize_right)

-- move windows
vim.keymap.set('n', '<leader>H', ss.swap_buf_left)
vim.keymap.set('n', '<leader>J', ss.swap_buf_down)
vim.keymap.set('n', '<leader>K', ss.swap_buf_up)
vim.keymap.set('n', '<leader>L', ss.swap_buf_right)
