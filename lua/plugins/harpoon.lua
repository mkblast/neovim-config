return {
  "ThePrimeagen/harpoon",
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      mode = "n",
      '<leader>h',
      function()
        require("harpoon.ui").nav_file(1)
      end,
      { noremap = true, silent = true }
    },
    {
      mode = "n",
      '<leader>j',
      function()
        require("harpoon.ui").nav_file(2)
      end,
      { noremap = true, silent = true }
    },
    {
      mode = "n",
      '<leader>k',
      function()
        require("harpoon.ui").nav_file(3)
      end,
      { noremap = true, silent = true }
    },
    {
      mode = "n",
      '<leader>l',
      function()
        require("harpoon.ui").nav_file(4)
      end,
      { noremap = true, silent = true }
    },
    {
      mode = "n",
      '<leader>;',
      function()
        require("harpoon.ui").nav_file(5)
      end,
      { noremap = true, silent = true }
    },
    {
      mode = "n",
      '<leader>i',
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      { noremap = true, silent = true }
    },
    {
      mode = "n",
      '<leader>o',
      function()
        require("harpoon.mark").add_file()
      end,
      { noremap = true, silent = true }
    },
  },

  config = {}
}
