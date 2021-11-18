local saga = {}

saga.config_values = {
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  dianostic_header_icon = "   ",
  -- code action title icon
  max_preview_lines = 20,
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "round",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
}

local extend_config = function(opts)
  opts = opts or {}
  if next(opts) == nil then
    return
  end
  for key, value in pairs(opts) do
    if saga.config_values[key] == nil then
      error(string.format("[LSP] Key %s not exist in config values", key))
      return
    end
    if type(saga.config_values[key]) == "table" then
      for k, v in pairs(value) do
        saga.config_values[key][k] = v
      end
    else
      saga.config_values[key] = value
    end
  end
end

function saga.init_lsp_saga(opts)
  extend_config(opts)
  local diagnostic = require "rv.lsp.diagnostic"

  if saga.config_values.use_saga_diagnostic_sign then
    diagnostic.lsp_diagnostic_sign(saga.config_values)
  end
  if saga.config_values.code_action_prompt.enable then
    print "No Code action"
  end
end

return saga
