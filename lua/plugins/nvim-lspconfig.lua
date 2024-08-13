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

        { "j-hui/fidget.nvim", opts = {} },
    },

    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local opts = { buffer = event.buf, remap = false }

                vim.keymap.set("n", "<leader>ls", require("telescope.builtin").lsp_document_symbols, opts)
                vim.keymap.set("n", "<leader>lw", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
                vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, opts)

                vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
                vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
                vim.keymap.set("n", "go", require("telescope.builtin").lsp_type_definitions, opts)
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
                vim.keymap.set({ "n", "x" }, "<leader>lf", vim.lsp.buf.format, opts)

                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

                vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
                        end,
                    })
                end
            end,
        })

        local signs = { Error = "", Warn = " ", Hint = "", Info = "", Other = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        local servers = {
            -- tsserver = {},
            rust_analyzer = {},
            clangd = {},
            basedpyright = {},
            lua_ls = {},
            html = {},
            emmet_language_server = {},
            cssls = {},
            eslint = {},
            gopls = {},
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {})

        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            handlers = {
                -- default handler
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })

        -- setup custom lsp not in mason.
        -- local lspconfig = require("lspconfig")
        -- lspconfig["gdscript"].setup({
        --     capabilities = capabilities,
        -- })
    end,
}
