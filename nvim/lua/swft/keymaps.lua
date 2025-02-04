local function custom_keymaps(keymaps)
  for _, value in ipairs(keymaps) do
    local map = vim.keymap.set
    local opts = {}
    if value.opts then
      value.opts.desc = value[4]
      opts = value.opts
    else
      opts = { noremap = true, silent = true, desc = value[4] }
    end
    map(value[1], value[2], value[3], opts)
  end
end

local keymaps = {
  { "n", "g*", 'yiw/\\V\\C\\<<C-R>"\\><CR>Ncgn', "Add word to search" },
  { "v", "g*", 'y/\\V\\C<C-R>"<CR>Ncgn', "Add word to search" },
  { "v", "J", ":m '>+1<CR>gv=gv" },
  { "v", "K", ":m '<-2<CR>gv=gv" },
  { "n", "n", "nzz" },
  { "n", "N", "Nzz" },
  { { "n", "v" }, "G", "Gzz" },
  { "n", "]b", "<cmd>bn<CR>", "Next Buffer" },
  { "n", ";b", "<cmd>bn<CR>", "Next Buffer" },
  { "n", "[b", "<cmd>bp<CR>", "Previous Buffer" },

  { "n", "<leader>dd", '"_d', "Delete without yanking" },
  { "v", "<leader>dd", '"_d', "Delete without yanking" },

  {
    "n",
    "g<CR>",
    function()
      if vim.o.scrolloff > 0 then
        vim.o.scrolloff = 0
        vim.cmd "norm! zz"
        return
      end
      vim.o.scrolloff = 999
      vim.cmd "norm! zz"
    end,
    "Center the screen",
  },
  { "n", "<2-LeftMouse>", "<cmd>lua vim.lsp.buf.definition()<CR>zz", "Go to definition" },
  { "n", "<leader>fl", "gg=G<C-o>zz", "indent" },
  { "n", "<RightMouse>", "<C-o>zz", "Go Back" },
  { "c", "<C-n>", "<Down>", opts = { noremap = true } },
  { "c", "<C-p>", "<Up>", opts = { noremap = true } },
  { "i", "<C-h>", "<C-w>" },
  { "i", "<C-l>", "<C-c>zza" },
  { "i", "<C-d>", "<C-c>lce" },
  { { "n", "v" }, "'", "%" },
  { "n", "gO", "O<C-[>O" },
  { { "i", "s" }, "jk", "<Esc>" },

  {
    "n",
    "wm",
    ":ZenMode<CR>",
    "Zen Mode Toggle",
  },

  { "i", "<C-j>", "<C-c>o" },
  {
    "n",
    "<C-j>",
    ":cnext<CR>",
    "Next Item in Quickfix List",
  },

  { "i", "<C-k>", "<C-c>O" },
  {
    "n",
    "<C-k>",
    ":cprevious<CR>",
    "Prev Item in Quickfix List",
  },

  { "t", "<A-a>", [[<C-\><C-n>]] },
  {
    "n",
    "<leader>qq",
    ":q!<CR>",
    "Quit without Saving",
  },

  {
    "n",
    "<C-l>",
    "<C-^>zz",
    "Switch Files",
  },

  {
    { "n", "x", "o" },
    "H",
    "0",
    "Start of Line",
  },

  {
    { "n", "x", "o" },
    "L",
    "$",
    "End of Line",
  },

  { "n", "w", "<C-w>" },
  {
    "n",
    "wf",
    "<cmd>w<CR>",
    "Write File",
  },

  {
    "n",
    "zo",
    "za",
    "Toggle Fold",
  },

  {
    "n",
    "zO",
    "zA",
    "Toggle All Folds Under cursor",
  },

  {
    { "n", "x" },
    "<C-f>",
    "<C-u>zz",
    "I like Ctrl f, ok",
  },

  {
    "n",
    "<C-o>",
    "<C-o>zz",
    "Prev pos and center",
  },

  {
    "n",
    "<C-i>",
    "<C-i>zz",
    "Next pos and center",
  },

  {
    { "n", "x" },
    "<C-d>",
    "<C-d>zz",
    "Scroll Down & Center",
  },

  {
    "x",
    ">",
    ">gv",
    "Reselect Visual Indent",
  },

  {
    "x",
    "<",
    "<gv",
    "Reselect Visual Indent",
  },

  {
    "",
    "Y",
    [["+y]],
    "System Clipboard",
  },

  {
    "n",
    "YY",
    [["+yy]],
    "System Clipboard Line",
  },

  {
    "i",
    "<C-v>",
    '<C-r>"',
    "Paste last deleted, changed, or yanked content",
  },

  {
    "n",
    "<leader>ci",
    "=",
    "Indent",
  },

  {
    "n",
    "+",
    "<C-a>",
    "Increment",
  },

  {
    "n",
    "-",
    "<C-x>",
    "Decrement",
  },

  {
    "n",
    "gx",
    "<cmd>lua Swft.handle_url()<CR>",
    "Open URL under cursor",
  },

  {
    "n",
    "<leader>op",
    "<cmd>lua Swft.project_outline()<CR>",
    "Open Neorg project file",
  },

  {
    "n",
    "<leader>st",
    "<cmd>lua Swft.toggle_lualine()<CR>",
    "Toggle Lualine",
  },

  {
    "n",
    "<leader>ss",
    function()
      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/swft/snips/*.lua", true)) do
        vim.loader.reset(ft_path)
        loadfile(ft_path)()
      end
    end,
    "Source Snippets",
  },

  --  Undo Tree
  {
    "n",
    "<Leader>u",
    ":UndotreeToggle<CR>",
    "Undo Tree Toggle",
  },

  -- File Explorer
  {
    "n",
    "<leader>e",
    function()
      require("oil").toggle_float()
    end,
    "Toggle Oil float",
  },

  --  Telescope
  {
    "n",
    "<leader>fd",
    "<cmd>lua require('telescope.builtin').fd()<CR>",
    "Telescope fd",
  },

  {
    "n",
    "<leader>fg",
    "<cmd>lua require('telescope.builtin').live_grep()<CR>",
    "Telescope Live Grep",
  },

  {
    "n",
    "<leader>fb",
    "<cmd>lua require('telescope.builtin').buffers()<CR>",
    "Telescope buffers",
  },

  {
    "n",
    "<leader>fh",
    "<cmd>lua require('telescope.builtin').help_tags()<CR>",
    "Telescope search :help Docs",
  },

  {
    "n",
    "<leader>fo",
    "<cmd>Telescope lsp_document_symbols<CR>",
    "Telescope LSP workspace symbols",
  },

  {
    "n",
    "<leader>ff",
    "<cmd>lua Swft.project_files()<CR>",
    "Git Files or Find Files",
  },

  {
    "",
    "<C-p>",
    "<cmd>lua require('telescope.builtin').find_files()<CR>",
    "Telescope FInd Files",
  },

  {
    "n",
    "<leader>fc",
    "<cmd>Telescope builtin<CR>",
    "Telescope Command Palette",
  },

  {
    "n",
    "<leader>ft",
    "<cmd>TodoTelescope<CR>",
    "Telescope Todo",
  },

  {
    "n",
    "<leader>fi",
    "<cmd>Format<CR>",
    "Formatter",
  },

  -- TODO
  {
    "n",
    "]t",
    function()
      require("todo-comments").jump_next()
    end,
    "Next TODO",
  },

  {
    "n",
    ";t",
    function()
      require("todo-comments").jump_next()
    end,
    "Next TODO",
  },

  {
    "n",
    "[t",
    function()
      require("todo-comments").jump_prev()
    end,
    "Previous TODO",
  },

  -- Git
  {
    "n",
    "<leader>gs",
    "<cmd>lua Swft.fugitive_toggle()<CR>",
    "Git Fugitive Menu Toggle",
  },

  {
    "n",
    "<leader>gm",
    "<cmd>Gitsigns toggle_current_line_blame<CR>",
    "GitSigns Toggle Line Blame",
  },

  {
    "n",
    "<leader>gb",
    "<cmd>lua require('telescope.builtin').git_branches()<CR>",
    "Telescope Git Branches",
  },

  {
    "n",
    "<leader>gws",
    "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
    "Telescope search git worktrees",
  },

  {
    "n",
    "<leader>gwc",
    "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
    "Telescope create git worktrees",
  },

  {
    "n",
    "gh",
    ":diffget //3<CR>",
    "Git get changes from buffer 3",
  },

  {
    "n",
    "gf",
    ":diffget //2<CR>",
    "Git get changes from buffer 2",
  },

  {
    "n",
    "<leader>gr",
    "<cmd>Gitsigns refresh<CR>",
    "Gitsigns refresh",
  },

  -- treesitter

  {
    "n",
    "<leader>sc",
    "<cmd>TSContextToggle<CR>",
    "Toggle treesitter context",
  },

  {
    "n",
    "<leader>tS",
    function()
      vim.treesitter.inspect_tree()
    end,
    "Toggle Treesitter tree",
  },

  {
    "n",
    "gw",
    "gi",
    "Last Insertion",
  },

  --LSP
  {
    "n",
    "gi",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    "LSP implementation",
  },

  {
    "n",
    "<leader>rn",
    "<cmd>lua vim.lsp.buf.rename()<CR>",
    "LSP rename",
  },

  {
    "n",
    "<leader>cs",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    "LSP signature help",
  },

  {
    "n",
    "<leader>cd",
    "<cmd>lua vim.diagnostic.open_float()<CR>",
    "LSP current line Diagnostics",
  },

  {
    "n",
    "<leader>j",
    "<cmd>lua vim.diagnostic.goto_next()<CR>",
    "Diagnostic Next",
  },

  {
    "n",
    "<leader>k",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    "Diagnostic Previous",
  },

  -- LSP config (the mappings used in the default file don't quite work right)
  {
    "n",
    "gR",
    "<cmd>lua vim.lsp.buf.references()<CR>",
    "LSP references",
  },

  {
    "n",
    "K",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    "LSP Hover",
  },

  {
    "n",
    "<leader>cf",
    "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
    "LSP Formatting",
  },

  {
    "n",
    "<leader>ca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    "LSP Code Actions",
  },

  -- lsp trouble
  {
    "n",
    "gd",
    "<cmd>Trouble lsp_definitions<CR>",
    "LSP definition",
  },

  {
    "n",
    "gD",
    "<cmd>Trouble lsp_declarations<CR>",
    "LSP declaration",
  },

  {
    "n",
    "gI",
    "<cmd>Trouble lsp_implementations<CR>",
    "LSP declaration",
  },

  {
    "n",
    "<leader>tw",
    "<cmd>Trouble diagnostics toggle<CR>",
    "Trouble Toggle",
  },

  {
    "n",
    "<leader>td",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    "Trouble Toggle Document Diagnostics",
  },

  {
    "n",
    "<leader>tq",
    "<cmd>Trouble qflist toggle<CR>",
    "Trouble Toggle Quickfix List",
  },

  {
    "n",
    "<leader>tl",
    "<cmd>Trouble loclist toggle<CR>",
    "Trouble Toggle Local List",
  },

  {
    "n",
    "<leader>ts",
    "<cmd>Trouble symbols toggle focus=false<CR>",
    "Trouble toggle symbols",
  },

  {
    "n",
    "gr",
    "<cmd>Trouble lsp_references<CR>",
    "Trouble LSP references",
  },

  -- LSP custom functions
  {
    "n",
    "gl",
    "<cmd>lua Swft.peek_definition()<CR>",
    "LSP peek definition",
  },

  -- Debugging keymaps
  {
    "n",
    "<leader>dcc",
    '<cmd>lua require"dap".continue()<CR>',
    "Dap Continue",
  },

  {
    "n",
    "<leader>dcr",
    '<cmd>lua require"dap".reverse_continue()<CR>',
    "Dap Reverse Continue",
  },

  {
    "n",
    "<leader>dv",
    '<cmd>lua require"dap".step_over()<CR>',
    "Dap Step Over",
  },

  {
    "n",
    "<leader>di",
    '<cmd>lua require"dap".step_into()<CR>',
    "Dap Step Into",
  },

  {
    "n",
    "<leader>do",
    '<cmd>lua require"dap".step_out()<CR>',
    "Dap Step Out",
  },

  {
    "n",
    "<leader>dsb",
    '<cmd>lua require"dap".step_back()<CR>',
    "Dap Step Back",
  },

  {
    "n",
    "<leader>dk",
    '<cmd>lua require"dap".up()<CR>',
    "Dap Step Up",
  },

  {
    "n",
    "<leader>dj",
    '<cmd>lua require"dap".down()<CR>',
    "Dap Step Down",
  },

  {
    "n",
    "<leader>dbt",
    '<cmd>lua require"dap".toggle_breakpoint()<CR>',
    "Dap Toggle Breakpoint",
  },

  {
    "n",
    "<leader>dbc",
    '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    "Dap Conditional Breakpoint",
  },

  {
    "n",
    "<leader>dbm",
    '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
    "Dap set breakpoint with log",
  },

  {
    "n",
    "<leader>dbe",
    ':lua require"dap".set_exception_breakpoints({"all"})<CR>',
    "Dap Set Exception Breakpoint",
  },

  {
    "n",
    "<leader>drt",
    ':lua require"dap".repl.toggle({}, "40vsplit")<CR>',
    "Dap REPL toggle",
  },

  {
    "n",
    "<leader>drl",
    '<cmd>lua require"dap".repl.run_last()<CR>',
    "Dap REPL Run Last",
  },

  {
    "n",
    "<leader>d?",
    ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>',
    "Dap Scopes (Float)",
  },

  {
    "n",
    "<leader>dh",
    ':lua require"dap.ui.widgets".hover()<CR>',
    "Dap Hover",
  },

  -- telescope-dap
  {
    "n",
    "<leader>dtc",
    '<cmd>lua require"telescope".extensions.dap.commands{}<CR>',
    "Telescope dap commands",
  },

  {
    "n",
    "<leader>dts",
    '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>',
    "Telescope dap configurations",
  },

  {
    "n",
    "<leader>dtb",
    '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>',
    "Telescope dap list breakpoint",
  },

  {
    "n",
    "<leader>dtv",
    '<cmd>lua require"telescope".extensions.dap.variables{}<CR>',
    "Telescope dap variables",
  },

  {
    "n",
    "<leader>dtf",
    '<cmd>lua require"telescope".extensions.dap.frames{}<CR>',
    "Telescope dap Frames",
  },

  {
    "n",
    "<leader>dui",
    '<cmd>lua require("dapui").toggle()<CR>',
    "DAPUI Toggle",
  },

  -- Render Markdown
  {
    "n",
    "<leader>ma",
    "<cmd>RenderMarkdown toggle<CR>",
    "Toggle Render Markdown",
  },
}

custom_keymaps(keymaps)
