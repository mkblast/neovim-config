return {
  "RRethy/vim-illuminate",

  config = function()
    require('illuminate').configure({
      delay = 100,
      filetypes_denylist = {
        'dirbuf',
        'dirvish',
        'fugitive',
        'NeogitStatus',
      },
    })
  end
}
