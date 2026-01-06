return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        {
            'nvim-treesitter/nvim-treesitter-context',
            opts = {
                max_lines = 4,
                multiline_threshold = 2,
            },
        },
    },
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        local ts = require('nvim-treesitter')

        ts.install({
            "c",
            "jsdoc",
            "lua",
            "bash",
            "vim",
            "vimdoc",
            "query",
        }, {
            max_jobs = 8,
        })

        local available_langs = ts.get_available()

        local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

        -- Auto-install parsers and enable highlighting on FileType
        vim.api.nvim_create_autocmd('FileType', {
            group = group,
            desc = 'Enable treesitter highlighting and indentation',
            callback = function(event)
                local lang = vim.treesitter.language.get_lang(event.match) or event.match
                local buf = event.buf

                if not vim.tbl_contains(available_langs, lang) then
                    return
                end

                -- Start highlighting immediately (works if parser exists)
                pcall(vim.treesitter.start, buf, lang)

                -- Enable treesitter indentation
                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                -- Install missing parsers (async, no-op if already installed)
                ts.install({ lang })
            end,
        })
    end,
}
