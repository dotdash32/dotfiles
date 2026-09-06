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

-- Route deletes/cuts to a dedicated register instead of the yank/clipboard, so
-- normal editing never overwrites what you copied. d -> register "d",
-- x -> register "x". Paste back with "dp / "xp.
-- Uses an <expr> map so an explicitly-typed register (e.g. "rdd, "rx) is
-- respected instead of being overridden by the hard-coded prefix.
local function cut_to(default_reg, keys)
  return function()
    local reg = vim.v.register
    -- '+' is the default register under clipboard=unnamedplus, '"' otherwise.
    if reg == '+' or reg == '"' then reg = default_reg end
    return '"' .. reg .. keys -- do NOT re-add v:count; the typed count is preserved
  end
end
vim.keymap.set('n', 'd',  cut_to('d', 'd'),  { expr = true })
vim.keymap.set('n', 'dd', cut_to('d', 'dd'), { expr = true })
vim.keymap.set('x', 'd',  cut_to('d', 'd'),  { expr = true })
vim.keymap.set('n', 'x',  cut_to('x', 'x'),  { expr = true })
vim.keymap.set('n', 'X',  cut_to('x', 'X'),  { expr = true })
vim.keymap.set('x', 'x',  cut_to('x', 'x'),  { expr = true })

-- center cursor after half-page jumps
vim.keymap.set("n", "<PageDown>", "<C-d>zz")
vim.keymap.set("n", "<PageUp>", "<C-u>zz")
vim.keymap.set({'n', 'v'}, '<A-j>', "3j")
vim.keymap.set({'n', 'v'}, '<A-k>', "3k")
vim.opt.scrolloff = 5
vim.opt.smoothscroll = true

-- move lines in visual mode, like VS Code
vim.keymap.set('v', '<A-S-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-S-k>', ":m '<-2<CR>gv=gv")
-- move back & forth w/ alt keys
vim.keymap.set({'n', 'v'}, '<A-h>', "b")
vim.keymap.set({'n', 'v'}, '<A-l>', "w")
vim.keymap.set({'n', 'v'}, '<A-S-h>', "B")
vim.keymap.set({'n', 'v'}, '<A-S-l>', "W")
-- insert "double newline"
vim.keymap.set('n', '<A-o>', "O<CR>")

-- Handle splits & tabs more easily
-- Open splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>")  -- vertical
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>")   -- horizontal
vim.keymap.set("n", "<leader>sn", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<leader>sc", "<cmd>tabclose<cr>")
vim.keymap.set("n", "<leader>sw", "<cmd>q<cr>")

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

