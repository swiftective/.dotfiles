require("dressing").setup {
  input = {
    default_prompt = "➤ ",

    insert_only = true,

    anchor = "SW",
    relative = "cursor",
    row = 0,
    col = 0,
    border = "rounded",

    prefer_width = 40,
    max_width = nil,
    min_width = 20,

    winblend = 10,

    prompt_buffer = false,

    get_config = nil,
  },
  select = {
    backend = { "telescope", "builtin" },

    telescope = {
      theme = "cursor",
    },

    builtin = {
      anchor = "NW",
      relative = "cursor",
      row = 0,
      col = 0,
      border = "rounded",
      winblend = 10,

      width = nil,
      max_width = 0.8,
      min_width = 40,
      height = nil,
      max_height = 0.9,
      min_height = 10,
    },

    get_config = nil,
  },
}
