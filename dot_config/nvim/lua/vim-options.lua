vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- tab sizes
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- configure searches for case insensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

--- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- copy file paths to clipboard
vim.keymap.set("n", "<leader>cp", function() vim.fn.setreg("+", vim.fn.expand("%")) end, { desc = "Copy relative path" })
vim.keymap.set("n", "<leader>cP", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, { desc = "Copy full path" })

-- center cursor after half-page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- move lines in visual mode, like VS Code
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

if vim.g.vscode then
    -- vscode-neovim handles clipboard natively, no provider needed
    vim.opt.clipboard = 'unnamedplus'
else
    -- terminal Neovim: use OSC 52
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
    vim.opt.clipboard = 'unnamedplus'
end
