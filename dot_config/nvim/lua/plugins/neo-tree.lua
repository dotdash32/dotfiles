return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      opts = {
        hint = "floating-big-letter",
      },
    },
  },
  keys = {
    { "<C-n>", "<cmd>Neotree filesystem toggle left<cr>" },
    { "<leader>bf", "<cmd>Neotree buffers reveal float<cr>" },
    { "<leader>be", function()
      vim.cmd("Neotree reveal")
      vim.defer_fn(function() vim.cmd("normal! zz") end, 50)
    end },
  },
}
