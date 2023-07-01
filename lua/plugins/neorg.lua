return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            folds = false,
            icon_preset = "diamond"

          }
        },                  -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Documents/notes",
            },
            index = "index.norg",
            default_workspace = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            neorg_leader = ",",
          }
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp"
          }
        },
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode"
          }
        },
      },
    }
  end,
}
