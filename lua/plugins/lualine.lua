return {
  'nvim-lualine/lualine.nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },

  config = function()
    require 'lualine'.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        transparent = false,
        component_separators = { left = '•', right = '•' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },

      sections = {
        lualine_c = {
          {
            'filename',
            show_filename_only = false,
            newfile_status = true,
            path = 1,
          }
        }
      }
    }
  end
}
