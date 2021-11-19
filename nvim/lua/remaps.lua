local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("i", "jk", "<Esc>", opts)
map("n", "<Leader>rc", ":source $MYVIMRC<CR>", opts)
map("n", "<Leader>o", ":SymbolsOutline<CR>", opts)
map("n", "<leader>wm", ":MaximizerToggle<CR>", opts)
map("n", "<leader>n", ":cnext<CR>", opts)
map("n", "<leader>p", ":cprevious<CR>", opts)
map("t", "<A-s>", [[<C-\><C-n>]], opts)
map("n", "<leader>qq", ":q!<CR>", opts)
map("n", "<C-l>", "<C-^>", opts)
map("n", "<leader>w<", "5<C-w><", opts)
map("n", "<leader>w>", "5<C-w>>", opts)
map("", "L", "$", opts)
map("", "H", "0", opts)
map("n", "<leader>w", "<C-w>", opts)
map("n", "zo", "za", opts)
map("n", "<C-f>", "<C-u>", opts)
map("x", ">", ">gv", opts)
map("x", "<", "<gv", opts)
map("n", "Y", [["+y]], opts)
map("i", "<C-v>", '<C-r>"', opts)

--  Undo Tree
map("n", "<Leader>u", ":UndotreeToggle<CR>", opts)

-- File Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Lightspeed
map("", ";", "<Plug>Lightspeed_;_sx", { noremap = false })
map("", ",", "<Plug>Lightspeed_,_sx", { noremap = false })
map("", ";", "<Plug>Lightspeed_;_ft", { noremap = false })
map("", ",", "<Plug>Lightspeed_,_ft", { noremap = false })

--  Telescope
map("n", "<leader>fd", "<cmd>lua require('telescope.builtin').fd()<cr>", opts)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
map("n", "<leader>fo", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map("", "<C-p>", "<cmd>lua require('telescope-config').project_files()<CR>", opts)
map("", "<A-p>", "<cmd>Telescope builtin<CR>", opts)

-- Barbar
map("n", "<C-j>", ":BufferPrevious<CR>", opts)
map("n", "<C-k>", ":BufferNext<CR>", opts)
map("n", ">>", " :BufferMoveNext<CR>", opts)
map("n", "<<", ":BufferMovePrevious<CR>", opts)
map("n", "<leader>b1", ":BufferGoto 1<CR>", opts)
map("n", "<leader>b2", ":BufferGoto 2<CR>", opts)
map("n", "<leader>b3", ":BufferGoto 3<CR>", opts)
map("n", "<leader>b4", ":BufferGoto 4<CR>", opts)
map("n", "<leader>b5", ":BufferGoto 5<CR>", opts)
map("n", "<leader>b6", ":BufferGoto 6<CR>", opts)
map("n", "<leader>b7", ":BufferGoto 7<CR>", opts)
map("n", "<leader>b8", ":BufferGoto 8<CR>", opts)
map("n", "<leader>b9", ":BufferLast<CR>", opts)
-- Close buffer
map("n", "<leader>bc", ":BufferClose<CR>", opts)
-- Magic buffer-picking mode
map("n", "<leader>bp", ":BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)
-- pin buffer
map("n", "<leader>bi", ":BufferPin<CR>", opts)
