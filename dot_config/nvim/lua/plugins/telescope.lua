return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', 
        function()
          builtin.buffers( { sort_mru = true, ignore_current_buffer = false } )
        end, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope marks' })
      vim.keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, { desc = 'Telescope LSP document symbosl' })
      vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = 'Telescope treesitter' })
      -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

    end,
}
