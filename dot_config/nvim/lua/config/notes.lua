vim.pack.add( {
  { src = "https://github.com/vimwiki/vimwiki" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", },
  { src = "https://github.com/lukevanlukevan/frankly.nvim", },
})

-- set as markdown
vim.g.vimwiki_syntax = 'markdown'
vim.g.vimwiki_ext = 'md'

-- setup markdown formatting
require('render-markdown').setup({
  completions = { lsp = { enabled = true } },
  file_types = { 'markdown', 'vimwiki' },
})

vim.treesitter.language.register('markdown', 'vimwiki')

-- setup frankly, pop up todos
require('frankly').setup( {
  target_dir = "~/vimwiki/daily-todos/",
  border = "single",   -- single, rounded, etc.
  position = "center", -- topleft, topright, bottomleft, bottomright
  opts = { -- TODO(josh.d): this doesn't work yet....
    width = 0.8,         -- width of window in % of screen size
    height = 80,        -- height of window in % of screen size
  },
})

