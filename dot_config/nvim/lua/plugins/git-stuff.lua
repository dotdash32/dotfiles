return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite" },
    keys = {
      { "<leader>gd", "<cmd>Gvdiffsplit<cr>" },
      { "<leader>gs", "<cmd>vertical topleft Git<cr>" },
      { "<leader>gl", "<cmd>vertical topleft Git log --oneline -n 40<cr>" },
      { "gdh",        "<cmd>diffget //2<cr>" }, -- from 2, rhs, "head"
      { "gdl",        "<cmd>diffget //3<cr>" }, -- from 3, lhs
    },
    config = function()
      -- fugitive always opens its editor (commit msg, rebase todo) in a plain
      -- split; move it to a full-height column on the right instead
      vim.api.nvim_create_autocmd("User", {
        pattern = "FugitiveEditor",
        callback = function()
          vim.cmd("wincmd L")
        end,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
      vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", {})
      vim.keymap.set("n", "<leader>hh", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set('n', "]h", ':Gitsigns nav_hunk next --target=all<CR>')
      vim.keymap.set('n', "[h", ':Gitsigns nav_hunk prev --target=all<CR>')
      vim.keymap.set('n', "]H", ':Gitsigns nav_hunk next --target=unstaged<CR>')
      vim.keymap.set('n', "[H", ':Gitsigns nav_hunk prev --target=unstaged<CR>')
      vim.keymap.set('n', "<leader>hs", ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('n', "<leader>hr", ':Gitsigns reset_hunk<CR>')
    end
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>gw", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
    }
}
