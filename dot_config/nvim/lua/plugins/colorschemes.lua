return {
    {
      "itsfoss/warty.nvim",
      priority = 1000,
      lazy = false,
      config = function()
        require("warty").setup({
          -- your custom options here, or omit for defaults
        })
        vim.cmd.colorscheme("warty")
        vim.api.nvim_set_hl(0, 'Todo', { fg = '#000000', bg = '#b39ddb', cterm=bold, gui=bold })
      end,
  },
  { 
      "catppuccin/nvim", 
      name = "catppuccin", 
      priority = 999,
      config = function()
        require("warty").setup()
        -- vim.cmd.colorscheme("catppuccin-mocha")
      end,
  }
}
