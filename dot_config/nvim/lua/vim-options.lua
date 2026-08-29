vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.exrc = true -- enable per-folder config

require('vim._core.ui2').enable()

-- tab sizes
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- configure searches for case insensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>") -- clear search highlighing

--- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- copy file paths to clipboard, don't overwrite on delete
vim.keymap.set("n", "<leader>cp", function() vim.fn.setreg("+", vim.fn.expand("%")) end, { desc = "Copy relative path" })
vim.keymap.set("n", "<leader>cP", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, { desc = "Copy full path" })
vim.keymap.set('n', 'd', '"dd') -- can still access w/ "ap
vim.keymap.set('n', 'dd', '"ddd')
vim.keymap.set('v', 'd', '"dd')

-- center cursor after half-page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<PageDown>", "<C-d>zz")
vim.keymap.set("n", "<PageUp>", "<C-u>zz")
vim.keymap.set('n', '<A-j>', "3j")
vim.keymap.set('n', '<A-k>', "3k")
vim.opt.scrolloff = 5
vim.opt.smoothscroll = true

-- move lines in visual mode, like VS Code
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")
-- move back & forth w/ alt keys
vim.keymap.set('n', '<A-h>', "b")
vim.keymap.set('n', '<A-l>', "w")
-- insert "double newline"
vim.keymap.set('n', '<A-o>', "O<CR>")

-- Handle splits & tabs more easily
-- Open splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>")  -- vertical
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>")   -- horizontal
vim.keymap.set("n", "<leader>sn", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<leader>sc", "<cmd>tabclose<cr>")
vim.keymap.set("n", "<leader>sw", "<cmd>q<cr>")
-- vim.keymap.set("n", "<S-l>", "<cmd>tabnext<cr>")
-- vim.keymap.set("n", "<S-h>", "<cmd>tabprev<cr>")k

if not vim.g.vscode then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end
vim.opt.clipboard = 'unnamedplus'

