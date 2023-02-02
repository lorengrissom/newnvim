local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

-- Install your plugins here
require("lazy").setup({
  'nvim-lua/popup.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  -- Colorschemes
  'folke/tokyonight.nvim',
  'joshdick/onedark.vim',
  'savq/melange',
  'rose-pine/neovim',
  'folke/lsp-colors.nvim',

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' } -- optional, for file icons
  },

  -- cmp plugins
  'hrsh7th/nvim-cmp', event = "InsertEnter",
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',

  -- snippets
  'rafamadriz/friendly-snippets',

  -- LSP
  'onsails/lspkind.nvim',
  'neovim/nvim-lspconfig',
  'VonHeikemen/lsp-zero.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'j-hui/fidget.nvim',
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require("null-ls").setup()
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  "mfussenegger/nvim-dap",
  "RishabhRD/nvim-lsputils",
  {
    "glepnir/lspsaga.nvim",
    event = 'BufRead',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = { { "kyazdani42/nvim-web-devicons" } }
  },
  'folke/lazy.nvim',
  'lukas-reineke/lsp-format.nvim',
  {
    'tzachar/cmp-tabnine',
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  -- common rules
  {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  },
  "norcalli/nvim-colorizer.lua",
  'nvim-treesitter/nvim-treesitter', cmd = ":TSUpdate", event = "BufWinEnter",
  "folke/which-key.nvim",
  "ellisonleao/glow.nvim",
  "rcarriga/nvim-notify",
})
