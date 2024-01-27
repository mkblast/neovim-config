return {
  "RRethy/vim-illuminate",

  config = function()
    require('illuminate').configure({
      filetyps_denylist = {
        'dirbuf',
        'dirvish',
        'fugitive',
        'NeogitStatus',
      },
    modes_allowlist = {
      'n',
    },
    })
  end
}
