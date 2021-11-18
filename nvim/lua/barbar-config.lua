local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

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

-- Set barbar's options
vim.g.bufferline = {
  animation = true,
  auto_hide = true,
  tabpages = true,
  closable = true,
  clickable = true,
  icon_close_tab = "",
  exclude_name = { "package.json" },
  icons = true,
  icon_custom_colors = false,
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  icon_close_tab_modified = "●",
  icon_pinned = "車",
  insert_at_start = true,
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
  no_name_title = nil,
}
