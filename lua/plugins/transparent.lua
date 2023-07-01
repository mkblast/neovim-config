return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeNormalFloat",
        "NvimTreeEndOfBuffer",
        'CursorColumn',
        'CursorLine',
      },                   -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    })
  end
}