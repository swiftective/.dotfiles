require("nvim-treesitter.configs").setup {
  ensure_installed = {"vim", "vimdoc", "lua", "c", "bash"},
  rainbow = {
    enable = false,
    max_file_lines = nil,
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
        ["]f"] = { query = "@function.outer", desc = "Next function" },
        [";f"] = { query = "@function.outer", desc = "Next function" },
        ["]c"] = { query = "@class.outer", desc = "Next class" },
        [";c"] = { query = "@class.outer", desc = "Next class" },
        ["]l"] = { query = "@loop.*", desc = "Next loop" },
        [";l"] = { query = "@loop.*", desc = "Next loop" },
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        [";s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]C"] = { query = "@conditional.outer", desc = "Next conditional" },
        [";C"] = { query = "@conditional.outer", desc = "Next conditional" },
      },
      goto_previous_start = {
        ["[f"] = { query = "@function.outer", desc = "Previous function" },
        ["[c"] = { query = "@class.outer", desc = "Previous class" },
        ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
        ["[C"] = { query = "@conditional.outer", desc = "Previous conditional" },
      },
      goto_next_end = {
        ["]m"] = { query = "@function.outer", desc = "Next function end" },
        [";m"] = { query = "@function.outer", desc = "Next function end" },
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "a function" },
        ["if"] = { query = "@function.inner", desc = "inner function" },
        ["al"] = { query = "@loop.outer", desc = "a loop" },
        ["il"] = { query = "@loop.inner", desc = "inner loop" },
        ["aC"] = { query = "@conditional.outer", desc = "a conditional" },
        ["iC"] = { query = "@conditional.inner", desc = "inner conditional" },
        ["ac"] = { query = "@class.outer", desc = "a class" },
        ["ic"] = { query = "@class.inner", desc = "inner class" },
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

vim.schedule(require("swft.utils").color_brackets)
