local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("i", "jk", "<Esc>", opts)

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

map("n", "<Leader>rc", ":source $MYVIMRC<CR>", opts)

map("n", "<Leader>o", ":SymbolsOutline<CR>", opts)

map("n", "<leader>wm", ":MaximizerToggle<CR>", opts)

map("n", "<leader>n", ":cnext<CR>", opts)

map("n", "<leader>p", ":cprevious<CR>", opts)

map("n", "<Leader>u", ":UndotreeToggle<CR>", opts)

map("t", "<A-s>", "<C-\\><C-n>", opts)

map("n", "<leader>qq", ":q!<CR>", opts)

map("n", "<silent><C-l>", "<C-^>", opts)

map("n", "<leader>w<", "5<C-w><", opts)

map("n", "<leader>w>", "5<C-w>>", opts)

map("", "L", "$", opts)
map("", "H", "0", opts)

map("n", "<leader>w", "<C-w>", opts)

map("n", "zo", "za", opts)

map("n", "<C-f>", "<C-u>", opts)

map("x", ">", ">gv", opts)
map("x", "<", "<gv", opts)

map("n", "Y", '+y"', opts)

map("i", "<C-v>", '<C-r>"', opts)

map("", ";", "<Plug>Lightspeed_;_sx", { noremap = false })
map("", ",", "<Plug>Lightspeed_,_sx", { noremap = false })
map("", ";", "<Plug>Lightspeed_;_ft", { noremap = false })
map("", ",", "<Plug>Lightspeed_,_ft", { noremap = false })
