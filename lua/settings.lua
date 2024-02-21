-- aliases
local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

-- setting the leader key
g.mapleader = ' '

-- general
opt.mouse = 'a'
opt.mousemodel = "extend"
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.undofile = true

opt.conceallevel = 3
opt.concealcursor = "n"

-- ui
opt.title = true
opt.colorcolumn = "80"
opt.autoread = true
opt.number = true
opt.rnu = true
opt.showmatch = true
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.linebreak = true
opt.showmode = false
opt.wrap = false
opt.scrolloff = 8
opt.cursorline = true
opt.signcolumn = 'yes'
opt.timeout = false
opt.hlsearch = false
opt.ignorecase = true
opt.termguicolors = true
opt.fillchars = { eob = " " }

-- optimazations
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240

-- tabs, indent
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.breakindent = true

-- vim commands

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,yaml,json,norg,javascriptreact setlocal shiftwidth=2 tabstop=2
]]

vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Remove whitespace on save',
    pattern = '*',
    callback = function()
        local curpos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, curpos)
    end
})

-- Jump to last edit position on opening file
vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Open file at the last position it was edited earlier',
    group = misc_augroup,
    pattern = '*',
    command = 'silent! normal! g`"zv'
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    group = highlight_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- autocompletion
-- insert mode completion options
opt.completeopt = 'menuone,noselect'

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
    "m tabout in blockcomment stringsatchit",
    "matchparen",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- disable nvim intro
opt.shortmess:append "sI"
