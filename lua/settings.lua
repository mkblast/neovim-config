-- new ui
require('vim._core.ui2').enable({
    enable = true,
    msg = {
        targets = 'cmd',
        cmd = {
            height = 0.5
        },
        dialog = {
            height = 0.5,
        },
        msg = {
            height = 0.5,
            timeout = 4000,
        },
        pager = {
            height = 1,
        },
    },
})

-- Diagnostic
vim.diagnostic.config({
    virtual_text = { current_line = true },
    severity_sort = true,
    jump = { float = true },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚',
            [vim.diagnostic.severity.WARN] = '󰀪',
            [vim.diagnostic.severity.INFO] = '󰋽',
            [vim.diagnostic.severity.HINT] = '󰌶',
        },
    },
})

-- aliases
local autocmd = vim.api.nvim_create_autocmd
local g       = vim.g
local opt     = vim.opt


-- setting the leader key
g.mapleader       = " "

-- general
opt.swapfile      = false
opt.backup        = false
opt.undodir       = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.undofile      = true
opt.confirm       = true

-- ui
opt.title         = true
opt.colorcolumn   = "80"
opt.autoread      = true
opt.number        = true
opt.rnu           = true
opt.showmatch     = true
opt.foldmethod    = "marker"
opt.splitright    = true
opt.splitbelow    = true
opt.ignorecase    = true
opt.smartcase     = true
opt.linebreak     = true
opt.showmode      = false
opt.wrap          = false
opt.scrolloff     = 8
opt.cursorline    = true
opt.signcolumn    = "yes"
opt.timeout       = false
opt.hlsearch      = true
opt.termguicolors = true
opt.inccommand    = "split"
opt.fillchars     = { eob = " " }

-- optimazations
opt.hidden        = true
opt.history       = 100
opt.lazyredraw    = true
opt.synmaxcol     = 240

-- Decrease update time
opt.updatetime    = 250

-- tabs, indent, editing
opt.expandtab     = true
opt.shiftwidth    = 4
opt.tabstop       = 4
opt.smartindent   = true
opt.breakindent   = true
opt.autoindent    = true
opt.formatoptions = "rqnl1j"
opt.spelloptions  = 'camel'
opt.virtualedit   = 'block'

-- autocompletion
-- insert mode completion options
opt.completeopt   = "menuone,noselect"

vim.filetype.add({
    extension = {
        ["http"] = "http",
    },
})


autocmd("FileType", {
    desc = "remove line length marker for selected filetypes",
    pattern = "text,markdown,html,xhtml,oil",
    callback = function()
        vim.opt_local.cc:append({ 0 })
    end
})

autocmd("FileType", {
    desc = " 2 spaces for selected filetypes",
    pattern = "xml,html,xhtml,css,scss,yaml,json,norg,pug",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop    = 2
    end
})

-- Jump to last edit position on opening file
autocmd("BufReadPost", {
    desc = "Open file at the last position it was edited earlier",
    pattern = "*",
    command = 'silent! normal! g`"zv'
})

autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    desc = "Reload file",
    command = "if mode() != 'c' | silent! checktime | endif",
    pattern = { "*" },
})

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    desc = "Highlight on yank",
    group = highlight_group,
    pattern = "*",
    callback = function()
        vim.hl.on_yank()
    end,
})

local oil_local_cwd = vim.api.nvim_create_augroup("OilLocalCwd", { clear = true })
autocmd("BufEnter", {
    group = oil_local_cwd,
    callback = function(o)
        if o.match:find("^oil://") then
            vim.cmd("lcd " .. require("oil").get_current_dir())
        else
            vim.cmd("lcd " .. vim.fn.getcwd(-1))
        end
    end,
})

-- startup
-- disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
