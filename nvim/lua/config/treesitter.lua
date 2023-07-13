require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    max_file_lines = nil,
    disable = { "html" },
  },
  highlight = {
    enable = true,
    disable = { "html" },
    extended_mode = true,
    max_file_lines = nil,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]f"] = "@function.outer",
        [";f"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        [";]"] = { query = "@class.outer", desc = "Next class start" },
        ["]l"] = "@loop.*",
        [";l"] = "@loop.*",
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        [";s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]c"] = "@conditional.outer",
        [";c"] = "@conditional.outer",
      },
      goto_next_end = {
        ["]m"] = "@function.outer",
        [";m"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[["] = "@class.outer",
        ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
        ["[c"] = "@conditional.outer",
      },
      goto_previous_end = {
        ["[m"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      include_surrounding_whitespace = false,
    },
  },
}

vim.schedule(function()
  vim.cmd "TSBufDisable rainbow"
  vim.cmd "TSBufEnable  rainbow"
end)
