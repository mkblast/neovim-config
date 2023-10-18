return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require('ibl').setup {
      exclude = {
        filetypes = {
          'help',
          'git',
          'markdown',
          'text',
          'terminal',
          'lspinfo',
          'packer',
          'norg',
        },
        buftypes = {
          'terminal',
          'nofile'
        },
      }
    }

   local hooks = require "ibl.hooks"
   hooks.register(
     hooks.type.WHITESPACE,
     hooks.builtin.hide_first_space_indent_level
   )

   hooks.register(
     hooks.type.WHITESPACE,
     hooks.builtin.hide_first_tab_indent_level
   )
  end
}
