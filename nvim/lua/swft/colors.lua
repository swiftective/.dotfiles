local function get_hl(hl_name)
  local hl = vim.api.nvim_get_hl(0, { name = hl_name })
  return hl
end

local function mod_hl(hl_name, opts)
  local is_ok, hl_def = pcall(get_hl, hl_name)
  if is_ok then
    for k, v in pairs(opts) do
      hl_def[k] = v
    end
    local ok, err = pcall(vim.api.nvim_set_hl, 0, hl_name, hl_def)
    if not ok then
      print(hl_name, err)
    end
    return
  end
  vim.api.nvim_set_hl(0, hl_name, opts)
end

local highlights = {
  { "NvimDapVirtualText", { fg = "#455574", bg = "none", bold = true } },
  { "TreesitterContext", { bg = "none" } },
  { "Folded", { fg = "#5c719c", bg = "#121212" } },
  { "IndentBlanklineContextChar", { fg = "cyan" } },
  { "TSVariable", { fg = "#aed8f2" } },
  { "IncSearch", { bg = "Cyan", fg = "Black" } },
  { "LineNr", { bg = "none", ctermbg = "none" } },
  { "SignColumn", { bg = "none", ctermbg = "none" } },
  { "EndOfBuffer", { bg = "none", ctermbg = "none", fg = "Black" } },
  { "cssUnitDecorators", { fg = "#d8636b" } },
  { "WinSeparator", { fg = "#353b54" } },
  { "UndotreeSavedBig", { bg = "none", fg = "#efbd5d" } },
  { "UndotreeSavedSmall", { bg = "none" } },
  { "UndotreeNode", { bg = "none" } },
  { "DiagnosticHint", { fg = "#1b6e6a" } },
  { "DiagnosticHint", { fg = "#1b6e6a" } },
  { "DiagnosticInformation", { fg = "#6699cc" } },
  { "DiagnosticVirtualTextWarn", { bg = "none" } },
  { "DiagnosticVirtualTextWarning", { bg = "none", fg = "#e0af68" } },
  { "DiagnosticVirtualTextError", { bg = "none" } },
  { "DiagnosticVirtualTextInfo", { bg = "none" } },
  { "DiagnosticVirtualTextHint", { bg = "none" } },
  { "FloatBorder", { bg = "none", fg = "#565f89" } },
  { "DressingHl", { bg = "none" } },
  { "Headline", { bg = "none" } },
  { "CodeBlock", { bg = "none" } },
  { "Pmenu", { fg = "#C0C5CE", bg = "none" } },
  { "TelescopeNormal", { bg = "none" } },
  { "TelescopeBorder", { bg = "none", fg = "#565f89" } },
  { "TelescopePromptBorder", { bg = "none", fg = "#565f89" } },
  { "TelescopePromptTitle", { bg = "none", fg = "#565f89" } },

  { "rainbowcol1", { fg = "#f7768e", bg = "none" } },
  { "rainbowcol2", { fg = "#e0af68", bg = "none" } },
  { "rainbowcol3", { fg = "#7aa2f7", bg = "none" } },
  { "rainbowcol4", { fg = "#bb9af7", bg = "none" } },
  { "rainbowcol5", { fg = "#b4f9f8", bg = "none" } },
  { "rainbowcol6", { fg = "#5a76cc", bg = "none" } },
  { "rainbowcol7", { fg = "#f7768e", bg = "none" } },

  { "@markup.heading.1.markdown", { fg = "#f7768e" } },
  { "@markup.heading.2.markdown", { fg = "#7aa2f7" } },
  { "@markup.heading.3.markdown", { fg = "#e0af68" } },
  { "@markup.heading.4.markdown", { fg = "#7dcfff" } },
  { "@markup.heading.5.markdown", { fg = "#7dcfff" } },
  { "@markup.heading.6.markdown", { fg = "#7dcfff" } },
  { "@markup.list.markdown", { fg = "#5c719c" } },
  { "RenderMarkdownBullet", { fg = "#5c719c" } },
  { "RenderMarkdownTableHead", { fg = "#7dcfff" } },
  { "RenderMarkdownTableRow", { fg = "#7aa2f7" } },
  { "RenderMarkdownDash", { fg = "#5c719c" } },
  { "RenderMarkdownUnchecked", { fg = "#f7768e" } },
  { "RenderMarkdownTodo", { fg = "#e0af68" } },
  { "@markup.strikethrough", { fg = "#5c719c" } },

  { "StatusLine", { bg = "none" } },
  { "StatusLineNC", { bg = "none" } },
  { "CmpBorder", { fg = "#353b54" } },
  { "LeapBackdrop", { link = "Comment" } },
  { "LeapMatch", { fg = "white", bold = true, nocombine = true } },
  { "LeapLabel", { fg = "cyan", bold = true, nocombine = true } },
  { "LeapLabelPrimary", { fg = "cyan", bold = true, nocombine = true } },
  { "LeapLabelSecondary", { fg = "#7aa2f7", bold = true, nocombine = true } },
  { "htmlTagName", { fg = "#7aa2f7" } },
  { "htmlTag", { fg = "#565f89" } },
  { "htmlEndTag", { fg = "#565f89" } },
  { "@tag.delimiter", { fg = "#565f89" } },
  { "@tag.delimiter.tsx", { fg = "#565f89" } },
  { "htmlTitle", { fg = "#bb9af7" } },
  { "htmlSpecialTagName", { fg = "#7aa2f7" } },
  { "@tag", { fg = "#7aa2f7" } },
  { "@tag.tsx", { fg = "#7aa2f7" } },
  { "htmlH1", { fg = "#bb9af7" } },
  { "htmlH2", { fg = "#bb9af7" } },
  { "htmlH3", { fg = "#bb9af7" } },
  { "htmlH4", { fg = "#bb9af7" } },
  { "htmlH5", { fg = "#bb9af7" } },
  { "htmlH6", { fg = "#bb9af7" } },
  { "@punctuation.bracket", { fg = "#f7768e" } },
}

for _, val in ipairs(highlights) do
  mod_hl(val[1], val[2])
end
