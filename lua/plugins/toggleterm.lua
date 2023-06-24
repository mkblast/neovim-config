return {
  'akinsho/toggleterm.nvim',

  version = "*",

  config = function()
    require("toggleterm").setup {
      -- size = 60,
      open_mapping = [[<a-i>]],
      direction = 'horizontal',
      autochdir = true,
    }
  end
}
