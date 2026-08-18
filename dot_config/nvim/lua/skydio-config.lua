-- Filetype detection
vim.filetype.add({
  extension = {
    md = "markdown",
    cc = "cpp",
    lcm = "cpp",
    bzl = "bxl",
  },
  pattern = {
    [".*BUILD"] = "bzl",
    [".*BUILD%.bazel"] = "bzl",
    [".*WORKSPACE"] = "bzl",
  },
})

-- General options
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.colorcolumn = "101"
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.cindent = false
vim.opt.visualbell = false
vim.opt.formatoptions:remove("t")

-- Filetype-specific indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "tex", "lcm", "proto", "djinni" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Hard wrap width for programming files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "java", "python" },
  callback = function()
    vim.opt_local.textwidth = 100
  end,
})
