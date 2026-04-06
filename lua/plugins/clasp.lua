return {
    "xzbdmw/clasp.nvim",

    event = "InsertEnter",

    opts = {
        pairs = { ["{"] = "}", ['"'] = '"', ["'"] = "'", ["("] = ")", ["["] = "]", ["<"] = ">", ["|"] = "|" },
        keep_insert_mode = true,
        remove_pattern = nil,
    },

    keys = {
        { mode = { "n", "i" }, "<a-l>", function() require("clasp").wrap("next") end, { noremap = true, silent = true } },
        { mode = { "n", "i" }, "<a-h>", function() require("clasp").wrap("prev") end, { noremap = true, silent = true } }
    },
}
