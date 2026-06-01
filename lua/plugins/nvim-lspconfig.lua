return {
    "neovim/nvim-lspconfig",

    dependencies = {
        {
            "williamboman/mason.nvim",
            build = function()
                pcall(vim.cmd, "MasonUpdate")
            end,
        },

        "williamboman/mason-lspconfig.nvim",

        "WhoIsSethDaniel/mason-tool-installer.nvim",

        {
            "j-hui/fidget.nvim",
            opts = {},
        },

        'saghen/blink.cmp',
    },

    config       = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local opts    = { buffer = event.buf, remap = false }
                local autocmd = vim.api.nvim_create_autocmd;
                local map     = vim.keymap.set

                map("n", "<leader>lw", vim.lsp.buf.workspace_symbol, opts)

                map("n", "gd", vim.lsp.buf.definition, opts)

                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "gD", vim.lsp.buf.declaration, opts)
                map("n", "grs", vim.lsp.buf.signature_help, opts)
                map({ "n", "x" }, "grf", vim.lsp.buf.format, opts)

                map("i", "<C-h>", vim.lsp.buf.signature_help, opts)

                map("n", "gl", vim.diagnostic.open_float, opts)
            end,
        })

        local capabilities     = require('blink.cmp').get_lsp_capabilities({}, true)

        local servers          = {
            clangd                = {
                cmd = {
                    "clangd",
                    "--fallback-style=webkit"
                }
            },
            lua_ls                = {},
            emmet_language_server = {
                filetypes = {
                    "astro", "css", "eruby", "html", "htmlangular", "htmldjango",
                    "javascriptreact", "less", "sass", "blade",
                    "scss", "svelte", "typescriptreact", "vue"
                }
            },
            gopls                 = {},
        }
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {})

        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
        require("mason").setup()
        require("mason-lspconfig").setup()

        for name, server in pairs(servers) do
            vim.lsp.config(name, server)
            vim.lsp.enable(name)
        end

        vim.lsp.config.gdscript = {
            capabilities = capabilities,
        }
        vim.lsp.enable("gdscript")
    end,
}
