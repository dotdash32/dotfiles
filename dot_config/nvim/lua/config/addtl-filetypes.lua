vim.filetype.add({
  extension = {
    lua = "lua",
  },
  pattern = {
    [".*.lua"] = "lua",
    [".*.toml.tmpl"] = "toml",
    [".*tmux.conf.tmpl"] = "tmux",
  },
  filename = {
    ["~/.tmux.conf"] = "tmux",
  },
})
-- Filetype-specific indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
  end,
})
