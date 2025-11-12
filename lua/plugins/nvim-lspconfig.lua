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

    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local opts = { buffer = event.buf, remap = false }
                local fzf = require("fzf-lua")
                local autocmd = vim.api.nvim_create_autocmd;
                local map = vim.keymap.set

                map("n", "gO", fzf.lsp_document_symbols, opts)
                map("n", "<leader>lw", fzf.lsp_live_workspace_symbols, opts)
                map("n", "<leader>ld", fzf.diagnostics_document, opts)

                map("n", "gd", fzf.lsp_definitions, opts)
                map("n", "gri", fzf.lsp_implementations, opts)
                map("n", "gro", fzf.lsp_typedefs, opts)
                map("n", "grr", fzf.lsp_references, opts)

                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "gD", vim.lsp.buf.declaration, opts)
                map("n", "grs", vim.lsp.buf.signature_help, opts)
                map("n", "gra", vim.lsp.buf.code_action, opts)
                map({ "n", "x" }, "grf", vim.lsp.buf.format, opts)

                map("i", "<C-h>", vim.lsp.buf.signature_help, opts)

                map("n", "gl", vim.diagnostic.open_float, opts)

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                    autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
                        end,
                    })
                end
            end,
        })

        vim.diagnostic.config({
            virtual_text = { current_line = true },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚',
                    [vim.diagnostic.severity.WARN] = '󰀪',
                    [vim.diagnostic.severity.INFO] = '󰋽',
                    [vim.diagnostic.severity.HINT] = '󰌶',
                },
            },
        })

        local capabilities = require('blink.cmp').get_lsp_capabilities({}, true)

        local servers = {
            clangd = {
                cmd = {
                    "clangd",
                    "--fallback-style=webkit"
                }
            },
            lua_ls = {},
            emmet_language_server = {},
            gopls = {},
            zls = {},
            harper_ls = {
                filetypes = { "markdown", "typst", "norg" },
            }
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {})

        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            ensure_installed = {},
            automatic_installation = false,
            handlers = {
                -- default handler
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    vim.lsp.config(server_name, server)
                    -- require("lspconfig")[server_name].setup(server)
                end,
            },
        })

        -- setup custom lsp not in mason.
        -- local lspconfig = require("lspconfig")
        -- lspconfig["gdscript"].setup({
        --     capabilities = capabilities,
        -- })
        vim.lsp.config.gdscript = {
            capabilities = capabilities,
        }
        vim.lsp.enable("gdscript")
    end,
}
