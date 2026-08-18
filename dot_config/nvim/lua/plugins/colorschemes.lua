return {
  "itsfoss/warty.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("warty").setup({
      -- your custom options here, or omit for defaults
    })
    vim.cmd.colorscheme("warty")
  end,
}
