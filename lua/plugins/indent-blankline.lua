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
  end
}
