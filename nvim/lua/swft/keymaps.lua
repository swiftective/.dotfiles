local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }

local function custom_keymaps(keymaps)
  for _, value in ipairs(keymaps) do
    map(value[1], value[2], value[3], { noremap = true, silent = true, desc = value.desc })
  end
end

local keymaps = {
  {
    "i",
    "<C-e>",
    "<C-[>ea",
  },
  {
    "i",
    "<C-b>",
    "<C-[>bi",
  },
  {
    "i",
    "<C-h>",
    "<Left>",
  },
  {
    "i",
    "<C-l>",
    "<Right>",
  },
  {
    { "i", "s" },
    "jk",
    "<Esc>",
  },
  -- map("n", "<Leader>ol", ":SymbolsOutline<CR>", opts)
  {
    "n",
    "<C-j>",
    ":cnext<CR>",
  },
  {
    "n",
    "<C-k>",
    ":cprevious<CR>",
  },
  {
    "t",
    "<A-a>",
    [[<C-\><C-n>]],
  },
  {
    "n",
    "<leader>qq",
    ":q!<CR>",
    desc = "Quit without Saving",
  },
  {
    "n",
    "<C-l>",
    "<C-^>",
  },
  {
    "n",
    "w<",
    "5<C-w><",
  },
  {
    "n",
    "w>",
    "5<C-w>>",
  },
  {
    { "n", "x", "o" },
    "H",
    "0",
  },
  {
    { "n", "x", "o" },
    "L",
    "$",
  },
  {
    "n",
    "w",
    "<C-w>",
  },
  {
    "n",
    "wf",
    "<cmd>w<CR>",
    desc = "Write File",
  },
  {
    "n",
    "zo",
    "za",
  },
  {
    "n",
    "zO",
    "zA",
  },
  {
    "n",
    "<C-f>",
    "<C-u>",
  },
  {
    "x",
    ">",
    ">gv",
  },
  {
    "x",
    "<",
    "<gv",
  },
  {
    "",
    "Y",
    [["+y]],
  },
  {
    "i",
    "<C-v>",
    '<C-r>"',
  },
  {
    "n",
    "=",
    "<C-a>",
  },
  {
    "n",
    "-",
    "<C-x>",
  },
  {
    "n",
    "gx",
    "<cmd>lua Swft.HandleURL()<CR>",
  },
  {
    "n",
    "<leader>st",
    "<cmd>lua Swft.ToggleLualine()<CR>",
  },
  --  Undo Tree
  {
    "n",
    "<Leader>u",
    ":UndotreeToggle<CR>",
    desc = "Undo Tree Toggle",
  },

  -- File Explorer
  {
    "n",
    "<leader>e",
    ":NvimTreeToggle<CR>",
    desc = "Nvim Tree Toggle",
  },

  --  Telescope
  {
    "n",
    "<leader>fd",
    "<cmd>lua require('telescope.builtin').fd()<CR>",
    desc = "Telescope fd",
  },
  {
    "n",
    "<leader>fg",
    "<cmd>lua require('telescope.builtin').live_grep()<CR>",
  },
  {
    "n",
    "<leader>fb",
    "<cmd>lua require('telescope.builtin').buffers()<CR>",
  },
  {
    "n",
    "<leader>fh",
    "<cmd>lua require('telescope.builtin').help_tags()<CR>",
  },
  {
    "n",
    "<leader>fo",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
  },
  {
    "n",
    "<leader>ff",
    "<cmd>lua require('telescope.builtin').find_files()<CR>",
  },
  {
    "",
    "<C-p>",
    "<cmd>lua Swft.project_files()<CR>",
  },
  {
    "",
    "<A-p>",
    "<cmd>Telescope builtin<CR>",
  },
  {
    "n",
    "<leader>fi",
    "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
  },

  -- Navigation
  {
    "n",
    "mm",
    "<cmd>lua require('harpoon.mark').add_file()<CR>",
  },
  {
    "n",
    ",o",
    "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
  },
  {
    "n",
    ",f",
    "<cmd>lua require('harpoon.ui').nav_file(1)<CR>",
  },
  {
    "n",
    ",d",
    "<cmd>lua require('harpoon.ui').nav_file(2)<CR>",
  },
  {
    "n",
    ",s",
    "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",
  },
  {
    "n",
    ",a",
    "<cmd>lua require('harpoon.ui').nav_file(4)<CR>",
  },
  {
    "n",
    ",j",
    "<cmd>lua require('harpoon.ui').nav_file(5)<CR>",
  },
  {
    "n",
    ",k",
    "<cmd>lua require('harpoon.ui').nav_file(6)<CR>",
  },
  {
    "n",
    ",l",
    "<cmd>lua require('harpoon.ui').nav_file(7)<CR>",
  },
  {
    "n",
    ",;",
    "<cmd>lua require('harpoon.ui').nav_file(8)<CR>",
  },

  -- Git
  {
    "n",
    "<leader>gs",
    "<cmd>lua Swft.FugitiveToggle()<CR>",
  },
  {
    "n",
    "<leader>gm",
    "<cmd>Gitsigns toggle_current_line_blame<CR>",
  },
  {
    "n",
    "<leader>gb",
    "<cmd>lua require('telescope.builtin').git_branches()<CR>",
  },
  {
    "n",
    "<leader>gws",
    "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
  },
  {
    "n",
    "<leader>gwc",
    "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
  },
  {
    "n",
    "<leader>gh",
    ":diffget //3<CR>",
  },
  {
    "n",
    "<leader>gf",
    ":diffget //2<CR>",
  },
  {
    "n",
    "<leader>gr",
    "<cmd>Gitsigns refresh<CR>",
  },

  -- treesitter
  {
    "n",
    "<leader>ts",
    "<cmd>TSPlaygroundToggle<CR>",
  },

  -- SnipRun

  --LSP
  {
    "n",
    "gi",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
  },
  {
    "n",
    "<leader>rn",
    "<cmd>lua vim.lsp.buf.rename()<CR>",
  },
  {
    "n",
    "<leader>cs",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
  },
  {
    "n",
    "<leader>cd",
    "<cmd>lua vim.diagnostic.open_float()<CR>",
  },
  {
    "n",
    "<leader>j",
    "<cmd>lua vim.diagnostic.goto_next()<CR>",
    desc = "Diagnostic Next",
  },
  {
    "n",
    "<leader>k",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    desc = "Diagnostic Previous",
  },

  -- LSP config (the mappings used in the default file don't quite work right)
  {
    "n",
    "gR",
    "<cmd>lua vim.lsp.buf.references()<CR>",
    desc = "LSP references",
  },
  {
    "n",
    "K",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
  },
  {
    "n",
    "<leader>ca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
  },

  -- lsp trouble
  {
    "n",
    "<leader>tt",
    "<cmd>TroubleToggle<CR>",
  },
  {
    "n",
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
  },
  {
    "n",
    "<leader>tw",
    "<cmd>TroubleToggle workspace_diagnostics<CR>",
  },
  {
    "n",
    "<leader>td",
    "<cmd>TroubleToggle document_diagnostics<CR>",
  },
  {
    "n",
    "<leader>tq",
    "<cmd>TroubleToggle quickfix<CR>",
  },
  {
    "n",
    "<leader>tl",
    "<cmd>TroubleToggle loclist<CR>",
  },
  {
    "n",
    "gr",
    "<cmd>TroubleToggle lsp_references<CR>",
  },

  -- LSP custom functions
  {
    "n",
    "gD",
    "<cmd>lua Swft.PeekDefinition()<CR>",
  },

  -- Debugging keymaps
  {
    "n",
    "<leader>dcc",
    '<cmd>lua require"dap".continue()<CR>',
  },
  {
    "n",
    "<leader>dcr",
    '<cmd>lua require"dap".reverse_continue()<CR>',
  },
  {
    "n",
    "<leader>dv",
    '<cmd>lua require"dap".step_over()<CR>',
  },
  {
    "n",
    "<leader>di",
    '<cmd>lua require"dap".step_into()<CR>',
  },
  {
    "n",
    "<leader>do",
    '<cmd>lua require"dap".step_out()<CR>',
  },
  {
    "n",
    "<leader>dsb",
    '<cmd>lua require"dap".step_back()<CR>',
  },
  {
    "n",
    "<leader>dk",
    '<cmd>lua require"dap".up()<CR>',
  },
  {
    "n",
    "<leader>dj",
    '<cmd>lua require"dap".down()<CR>',
  },
  {
    "n",
    "<leader>dbt",
    '<cmd>lua require"dap".toggle_breakpoint()<CR>',
  },
  {
    "n",
    "<leader>dbc",
    '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
  },
  {
    "n",
    "<leader>dbm",
    '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
  },
  {
    "n",
    "<leader>dbe",
    ':lua require"dap".set_exception_breakpoints({"all"})<CR>',
  },
  {
    "n",
    "<leader>drt",
    ':lua require"dap".repl.toggle({}, "40vsplit")<CR>',
  },
  {
    "n",
    "<leader>drl",
    '<cmd>lua require"dap".repl.run_last()<CR>',
  },
  {
    "n",
    "<leader>d?",
    ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>',
  },
  {
    "n",
    "<leader>dh",
    ':lua require"dap.ui.widgets".hover()<CR>',
  },
  -- jester
  {
    "n",
    "<leader>djdr",
    '<cmd>lua require"jester".debug({ path_to_jest = "../node_modules/.bin/jest" })<CR>',
  },
  {
    "n",
    "<leader>djr",
    ':lua require"jester".run()<cr>',
  },
  {
    "n",
    "<leader>djl",
    ':lua require"jester".run_last()<cr>',
  },
  {
    "n",
    "<leader>djf",
    ':lua require"jester".run_file()<cr>',
  },
  {
    "n",
    "<leader>djdl",
    ':lua require"jester".debug_last({ path_to_jest = "../node_modules/.bin/jest" })<cr>',
  },
  {
    "n",
    "<leader>djdf",
    ':lua require"jester".debug_file({ path_to_jest = "../node_modules/.bin/jest" })<cr>',
  },
  -- telescope-dap
  {
    "n",
    "<leader>dtc",
    '<cmd>lua require"telescope".extensions.dap.commands{}<CR>',
  },
  {
    "n",
    "<leader>dts",
    '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>',
  },
  {
    "n",
    "<leader>dtb",
    '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>',
  },
  {
    "n",
    "<leader>dtv",
    '<cmd>lua require"telescope".extensions.dap.variables{}<CR>',
  },
  {
    "n",
    "<leader>dtf",
    '<cmd>lua require"telescope".extensions.dap.frames{}<CR>',
  },
  {
    "n",
    "<leader>dui",
    '<cmd>lua require("dapui").toggle()<CR>',
  },
}

custom_keymaps(keymaps)

map("n", "#", ":%s/<C-r><C-w>//gc<Left><Left><Left>", { noremap = true })
map("v", "#", '"hy:%s/<C-r>h//gc<left><left><left>', { noremap = true })
map("n", "<leader>rs", "<Plug>SnipRunOperator", {})
map("v", "<leader>rs", "<Plug>SnipRun", {})
