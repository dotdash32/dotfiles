-- KanataGrammar, treesitter parser
-- nvim-treesitter rebuilds its parser table on every install/update, and fires
-- User TSUpdate each time, so registration has to happen in the callback.
vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").kanata = {
      install_info = {
        -- cloned from https://tangled.org/philocalyst.bsky.social/KanataGrammar
        path = vim.fn.expand("~/Documents/built-from-source/KanataGrammar"),
        queries = "queries",
      },
    }
  end,
})

vim.filetype.add({ extension = { kbd = "kanata" } })
