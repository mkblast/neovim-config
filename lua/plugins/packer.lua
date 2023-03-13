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

  use 'windwp/nvim-autopairs'

  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', } }

  use 'liuchengxu/vista.vim'

  use 'neovim/nvim-lspconfig'

  use { 'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      "rafamadriz/friendly-snippets"
    },
  }

  use 'nvim-lualine/lualine.nvim'

  use "ellisonleao/gruvbox.nvim"

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

  use "numtostr/FTerm.nvim"

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
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }

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
end)
