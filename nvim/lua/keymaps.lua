local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("i", "<C-e>", "<C-[>ea", opts)
map("i", "<C-b>", "<C-[>bi", opts)
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "jk", "<Esc>", opts)
map("n", "<Leader>ol", ":SymbolsOutline<CR>", opts)
map("n", "#", ":%s/<C-r><C-w>//gc<Left><Left><Left>", { noremap = true })
map("v", "#", '"hy:%s/<C-r>h//gc<left><left><left>', { noremap = true })
map("n", "<C-j>", ":cnext<CR>", opts)
map("n", "<C-k>", ":cprevious<CR>", opts)
map("t", "<A-s>", [[<C-\><C-n>]], opts)
map("n", "<leader>qq", ":q!<CR>", opts)
map("n", "<C-l>", "<C-^>", opts)
map("n", "w<", "5<C-w><", opts)
map("n", "w>", "5<C-w>>", opts)
map({ "n", "x", "o" }, "H", "0", opts)
map({ "n", "x", "o" }, "L", "$", opts)
map("n", "w", "<C-w>", opts)
map("n", "zo", "za", opts)
map("n", "zO", "zA", opts)
map("n", "<C-f>", "<C-u>", opts)
map("x", ">", ">gv", opts)
map("x", "<", "<gv", opts)
map("", "Y", [["+y]], opts)
map("i", "<C-v>", '<C-r>"', opts)
map("n", "=", "<C-a>", opts)
map("n", "-", "<C-x>", opts)
map("n", "<M-u>", "<cmd>lua Swft.HandleURL()<CR>", opts)
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
-- map("n", "<leader>fs", "<cmd>lua require('session-lens').search_session()<CR>", opts)
map("n", "<leader>fd", "<cmd>lua require('telescope.builtin').fd()<CR>", opts)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
map("n", "<leader>fo", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map("", "<C-p>", "<cmd>lua require('plugin.telescope').project_files()<CR>", opts)
map("", "<A-p>", "<cmd>Telescope builtin<CR>", opts)
map("n", "<leader>fi", "<cmd>LspFormat<CR>", opts)

-- Navigation
map("n", "mm", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
map("n", ",o", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
map("n", ",f", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)
map("n", ",d", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)
map("n", ",s", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)
map("n", ",a", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)
map("n", ",j", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", opts)
map("n", ",k", "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", opts)
map("n", ",l", "<cmd>lua require('harpoon.ui').nav_file(7)<CR>", opts)
map("n", ",;", "<cmd>lua require('harpoon.ui').nav_file(8)<CR>", opts)

-- Barbar
map("n", ">>", ":BufferMoveNext<CR>", opts)
map("n", "<<", ":BufferMovePrevious<CR>", opts)
map("n", "<leader>1", ":BufferGoto 1<CR>", opts)
map("n", "<leader>2", ":BufferGoto 2<CR>", opts)
map("n", "<leader>3", ":BufferGoto 3<CR>", opts)
map("n", "<leader>4", ":BufferGoto 4<CR>", opts)
map("n", "<leader>5", ":BufferGoto 5<CR>", opts)
map("n", "<leader>6", ":BufferGoto 6<CR>", opts)
map("n", "<leader>7", ":BufferGoto 7<CR>", opts)
map("n", "<leader>8", ":BufferGoto 8<CR>", opts)
map("n", "<leader>9", ":BufferLast<CR>", opts)
-- Close buffer
map("n", "<leader>bc", ":BufferClose<CR>", opts)
-- Magic buffer-picking mode
map("n", "<leader>s", ":BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferOrderByLanguage<CR>", opts)
-- pin buffer
map("n", "<leader>bi", ":BufferPin<CR>", opts)

-- Git
map("n", "<leader>gs", "<cmd>lua Swft.FugitiveToggle()<CR>", opts)
map("n", "<leader>gm", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
map("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>", opts)
map("n", "<leader>gws", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
map("n", "<leader>gwc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", opts)
map("n", "<leader>gh", ":diffget //3<CR>", opts)
map("n", "<leader>gf", ":diffget //2<CR>", opts)
map("n", "<leader>gr", "<cmd>Gitsigns refresh<CR>", opts)

-- treesitter
map("n", "<leader>ts", "<cmd>TSPlaygroundToggle<CR>", opts)

-- SnipRun
map("n", "<leader>rs", "<Plug>SnipRunOperator", {})
map("v", "<leader>rs", "<Plug>SnipRun", {})

--LSP
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

-- LSP config (the mappings used in the default file don't quite work right)
map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- lsp trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
map("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<CR>", opts)
map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<CR>", opts)
map("n", "<leader>tl", "<cmd>TroubleToggle loclist<CR>", opts)
map("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", opts)

-- LSP custom functions
map("n", "gD", "<cmd>lua require('swft.lsp').PeekDefinition()<CR>", opts)

-- Debugging keymaps
map("n", "<leader>dcc", '<cmd>lua require"dap".continue()<CR>', opts)
map("n", "<leader>dcr", '<cmd>lua require"dap".reverse_continue()<CR>', opts)
map("n", "<leader>dv", '<cmd>lua require"dap".step_over()<CR>', opts)
map("n", "<leader>di", '<cmd>lua require"dap".step_into()<CR>', opts)
map("n", "<leader>do", '<cmd>lua require"dap".step_out()<CR>', opts)
map("n", "<leader>dsb", '<cmd>lua require"dap".step_back()<CR>', opts)
map("n", "<leader>dk", '<cmd>lua require"dap".up()<CR>', opts)
map("n", "<leader>dj", '<cmd>lua require"dap".down()<CR>', opts)
map("n", "<leader>dbt", '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map("n", "<leader>dbc", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map("n", "<leader>dbm", '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
map("n", "<leader>dbe", ':lua require"dap".set_exception_breakpoints({"all"})<CR>', opts)
map("n", "<leader>drt", ':lua require"dap".repl.toggle({}, "40vsplit")<CR>', opts)
map("n", "<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>', opts)
map("n", "<leader>d?", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', opts)
map("n", "<leader>dh", ':lua require"dap.ui.widgets".hover()<CR>', opts)
-- jester
map("n", "<leader>djdr", '<cmd>lua require"jester".debug({ path_to_jest = "../node_modules/.bin/jest" })<CR>', opts)
map("n", "<leader>djr", ':lua require"jester".run()<cr>', opts)
map("n", "<leader>djl", ':lua require"jester".run_last()<cr>', opts)
map("n", "<leader>djf", ':lua require"jester".run_file()<cr>', opts)
map("n", "<leader>djdl", ':lua require"jester".debug_last({ path_to_jest = "../node_modules/.bin/jest" })<cr>', opts)
map("n", "<leader>djdf", ':lua require"jester".debug_file({ path_to_jest = "../node_modules/.bin/jest" })<cr>', opts)
-- telescope-dap
map("n", "<leader>dtc", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
map("n", "<leader>dts", '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
map("n", "<leader>dtb", '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
map("n", "<leader>dtv", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
map("n", "<leader>dtf", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)
map("n", "<leader>dui", '<cmd>lua require("dapui").toggle()<CR>', opts)
-- packer
map("n", "<leader>pc", "<cmd>PackerCompile<CR>", opts)
