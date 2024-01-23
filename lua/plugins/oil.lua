return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = {
    {
      mode = "n",
      '<C-n>',
      function()
        if vim.bo.filetype == 'oil' then
          require("oil").close()
        else
          require("oil").open(".")
        end
      end,
      { noremap = true, silent = true }
    },
  },

  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
        "size",
      },
      delete_to_trash = true,
    })
  end
}
