-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
-- for packages info see: init.lua (Lua modules)
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', } }

  use 'liuchengxu/vista.vim'

  use 'nvim-lualine/lualine.nvim'

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use "ellisonleao/gruvbox.nvim"
  use 'Mofiqul/vscode.nvim'

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use 'ahmedkhalf/project.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


  use 'NvChad/nvim-colorizer.lua'

  use 'baskerville/vim-sxhkdrc'

  use 'windwp/nvim-ts-autotag'

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  use 'kyazdani42/nvim-web-devicons'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'p00f/nvim-ts-rainbow'

  use 'ethanholz/nvim-lastplace'

  use("petertriho/nvim-scrollbar")

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use "onsails/lspkind.nvim"

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Required
      { 'hrsh7th/cmp-path' },         -- Required
      { 'saadparwaiz1/cmp_luasnip' }, -- Required
      { 'L3MON4D3/LuaSnip' },         -- Required
    }
  }

  use { "akinsho/toggleterm.nvim", tag = '*', }
end)
