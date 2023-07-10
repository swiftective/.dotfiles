return {

  { "tpope/vim-fugitive", cmd = "Git" },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
          delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        },
        preview_config = {
          border = "rounded",
        },
        numhl = false,
        linehl = false,
        current_line_blame = false,
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", ")", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Next Hunk" })

          map("n", "(", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Prev Hunk" })

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
          map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
          map("v", "<leader>hs", function()
            gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
          end, { desc = "Stage Hunk" })
          map("v", "<leader>hr", function()
            gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
          end, { desc = "Reset Hunk" })
          map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
          map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
          map("n", "<leader>hb", function()
            gs.blame_line { full = true }
          end, { desc = "Git Blame Line" })
          map("n", "<leader>gl", gs.toggle_current_line_blame, { desc = "Git Blame Toggle" })
          map("n", "<leader>hhd", gs.diffthis, { desc = "Git Diff" })
          map("n", "<leader>hhD", function()
            gs.diffthis "~"
          end, { desc = "Git Diff" })
          map("n", "<leader>htd", gs.toggle_deleted, { desc = "Git Toggle Deleted" })

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
        end,
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  { "ThePrimeagen/git-worktree.nvim", event = "VeryLazy" },
}
