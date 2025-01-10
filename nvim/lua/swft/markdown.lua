local M = {}

local ts = vim.treesitter
local utils = require "utils.treesitter"

M.toggle_checkbox = function()
  local node = ts.get_node()

  if not node then
    return
  end

  local item = utils.find_parent_node(node, "list_item")

  if not item then
    return
  end

  local unchecked = utils.find_child_node(item, "task_list_marker_unchecked")
  if unchecked then
    utils.set_node_text(unchecked, "[x]")
    return
  end

  local checked = utils.find_child_node(item, "task_list_marker_checked")
  if checked then
    utils.set_node_text(checked, "[ ]")
    return
  end

  local content = utils.find_child_node(item, "paragraph")

  if content then
    local text = utils.get_node_text(content)
    text[1] = string.gsub(text[1], "%[.%]", "[x]")
    utils.set_node_text(content, text)
    return
  end
end

local function indexof(value, table)
  for idx, val in ipairs(table) do
    if value == val then
      return idx
    end
  end
end

M.toggle_checkbox_state = function()
  local states = {
    " ",
    "-",
    "x",
  }

  local node = ts.get_node()

  if not node then
    return
  end

  local item = utils.find_parent_node(node, "list_item")

  if not item then
    return
  end

  local text = utils.get_node_text(item)

  local match = string.lower(string.match(text[1], "%[(.)%]"))

  if not match then
    return
  end

  local sub_idx = (indexof(match, states) % #states) + 1

  text[1] = string.gsub(text[1], "%[.%]", "[" .. states[sub_idx] .. "]")
  utils.set_node_text(item, text)
end

return M
