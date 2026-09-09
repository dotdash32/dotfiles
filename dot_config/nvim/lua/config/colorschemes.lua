-- Colorschemes managed via native vim.pack
vim.pack.add({
  { src = 'https://github.com/itsfoss/warty.nvim' },
  { src = 'https://github.com/catppuccin/nvim',        name = 'catppuccin' },
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/zenbones-theme/zenbones.nvim' },
  { src = 'https://github.com/rktjmp/lush.nvim' },  -- zenbones dependency
})

-- warty configuration.  Colors "separated" by claude
require('warty').setup({
  dim_inactive = {
    enabled = false,
    percent = 0.10,
  },
  custom_highlights = {
    Todo           = { fg = '#000000', bg = '#b39ddb', bold = true },
    MiniTrailspace = { bg = '#ff5555' }, -- bg is what makes blank cells visible

    -- de-cluster warty's pink/mauve band: give each category a distinct hue so
    -- variables/properties/parameters/keywords/comments stop blending together.
    -- variables read as near-plain text so they stop competing with keywords
    Identifier            = { fg = '#dfe3ea' },
    ['@variable']         = { fg = '#dfe3ea' },
    ['@variable.member']  = { fg = '#8fd1c4' }, -- struct/object fields -> teal
    ['@property']         = { fg = '#8fd1c4' },
    ['@field']            = { fg = '#8fd1c4' },
    -- parameters: soft coral + italic to separate from constants (orange)
    ['@variable.parameter'] = { fg = '#e6a3a3', italic = true },
    ['@parameter']          = { fg = '#e6a3a3', italic = true }, -- legacy alias
    -- punctuation recedes to a dim neutral instead of mauve
    ['@punctuation.bracket']   = { fg = '#9aa0ac' },
    ['@punctuation.delimiter'] = { fg = '#9aa0ac' },
    -- keyword stays the lone purple, nudged a touch more saturated
    Keyword      = { fg = '#c29fe8' },
    Statement    = { fg = '#c29fe8' },
    ['@keyword'] = { fg = '#c29fe8' },
    -- comment: desaturated grey so it recedes rather than reading as pink
    Comment      = { fg = '#8a8095', italic = true },
    ['@comment'] = { fg = '#8a8095', italic = true },
  },
})

-- catppuccin: install-only for now; uncomment to configure/use it.
require('catppuccin').setup({
  integrations = { mini = true, neotree = true, telescope = true, gitsigns = true, mason = true },
})

-- zenbones
vim.g.rosebones_lighten_noncurrent_window = true

-- Active colorscheme (the last colorscheme call is the one that sticks).
vim.cmd.colorscheme('warty')
