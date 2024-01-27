-- aliases
local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- don't use arrow keys
map('', '<up>', '<nop>', default_opts)
map('', '<down>', '<nop>', default_opts)
map('', '<left>', '<nop>', default_opts)
map('', '<right>', '<nop>', default_opts)

-- windows control
map('n', '<leader>ws', ':split<CR>', default_opts)
map('n', '<leader>wv', ':vsplit<CR>', default_opts)
map('n', '<leader>wf', ':split<CR>', default_opts)
map('n', '<leader>wc', ':close<CR>', default_opts)
map('n', '<leader>wo', ':on<CR>', default_opts)
map('n', '<leader>wh', ':hide<CR>', default_opts)

-- buffer control
map('n', '<leader>bd', ':bdelete!<CR>', default_opts)
map('n', '<leader>bs', ':w<cr>:bdelete<cr>', default_opts)
map('n', '<TAB>', ':bnext<CR>', default_opts)
map('n', '<S-TAB>', ':bprevious<CR>', default_opts)

-- teminal binding
map({ "t", "n" }, "<a-o>", "<C-\\><C-n>")

-- movment remaps
map("v", "J", ":m '>+1<CR>gv=gv", default_opts)
map("v", "K", ":m '<-2<CR>gv=gv", default_opts)

map("n", "J", "mzJ`z", default_opts)
map("n", "<C-d>", "<C-d>zz", default_opts)
map("n", "<C-u>", "<C-u>zz", default_opts)
map("n", "n", "nzzzv", default_opts)
map("n", "N", "Nzzzv", default_opts)

-- find and replace
map("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- clipboard remaps
map("x", "<leader>P", [["_dP]], default_opts)
map({ "n", "v" }, "<leader>p", [["+p]], default_opts)
map({ "n", "v" }, "<leader>y", [["+y]], default_opts)
map("n", "<leader>Y", [["+Y]], default_opts)
map({ "n", "v" }, "<leader>d", [["_d]], default_opts)
