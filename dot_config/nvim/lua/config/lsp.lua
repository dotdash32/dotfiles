vim.pack.add{
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    -- { src = 'https://github.com/mason-org/mason-lspconfig.nvim' }, -- doesn't do much now
}

require('mason').setup()

-- Prefer aircam's pinned clangd (matches llvm_tools clang-format 21).
-- Off-machine, Mason's clangd is on Neovim's PATH after mason.setup().
local function first_executable(paths)
  for _, path in ipairs(paths) do
    if vim.fn.executable(path) == 1 then
      return path
    end
  end
end

local clangd = first_executable({
  '/home/skydio/aircam/external/llvm_tools/bin/clangd',
  vim.fn.stdpath('data') .. '/mason/bin/clangd',
}) or 'clangd'

vim.lsp.config('clangd', {
  cmd = { clangd, '--background-index' },
  root_markers = { '.clangd', 'compile_commands.json', 'WORKSPACE' },
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
        },
    },
})

vim.lsp.config('pyright', {})

-- bazel like
vim.lsp.config('starpls', {})
vim.lsp.config('buildifier', {})

vim.lsp.enable({ 'clangd', 'lua_ls', 'pyright', 'starpls', 'buildifier' })

vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ho", "<cmd>LspClangdSwitchSourceHeader<cr>")
vim.keymap.set('n', 'grd',        vim.lsp.buf.definition)
vim.keymap.set('n', 'grD',        vim.lsp.buf.declaration)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end
    end,
})

vim.opt.completeopt = { 'menuone', 'noselect' }

vim.o.pumheight = 5
vim.o.pumborder = 'rounded'
