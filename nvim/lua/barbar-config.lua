
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-j>', ':BufferPrevious<CR>', opts)
map('n', '<C-k>', ':BufferNext<CR>', opts)
map('n', '>>', ' :BufferMoveNext<CR>', opts)
map('n', '<<', ':BufferMovePrevious<CR>', opts)
map('n', '<leader>1', ':BufferGoto 1<CR>', opts)
map('n', '<leader>2', ':BufferGoto 2<CR>', opts)
map('n', '<leader>3', ':BufferGoto 3<CR>', opts)
map('n', '<leader>4', ':BufferGoto 4<CR>', opts)
map('n', '<leader>5', ':BufferGoto 5<CR>', opts)
map('n', '<leader>6', ':BufferGoto 6<CR>', opts)
map('n', '<leader>7', ':BufferGoto 7<CR>', opts)
map('n', '<leader>8', ':BufferGoto 8<CR>', opts)
map('n', '<leader>9', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<leader>bc', ':BufferClose<CR>', opts)
-- Magic buffer-picking mode
map('n', '<leader>bp', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)
-- pin buffer
map('n', '<leader>bi', ':BufferOrderByLanguage<CR>', opts)


-- Set barbar's options
vim.g.bufferline = {
  animation = true,
  auto_hide = true,
  tabpages = true,
  closable = true,
  clickable = true,
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},
  icons = true,
  icon_custom_colors = false,
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = ' ',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  insert_at_end = false,
  insert_at_start = true,
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}

