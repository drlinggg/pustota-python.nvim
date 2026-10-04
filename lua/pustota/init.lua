-- pustota.nvim — a super-light, minimalist Neovim colorscheme.
--
-- White background, two blacks for most text, and three accents:
--   red  -> strings            pink -> numbers / None / True / False
--   blue -> keywords           cyan -> function / class / type names
-- Tuned for Python (Treesitter + pyright via coc.nvim), but the standard
-- groups make it work everywhere.

local M = {}

function M.load()
  local p = require("pustota.palette")

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.o.background = "light"
  vim.g.colors_name = "pustota"

  local groups = {
    -- ---------------------------------------------------------------- UI --
    Normal          = { fg = p.ink, bg = p.bg },
    NormalNC        = { fg = p.ink, bg = p.bg },
    NormalFloat     = { fg = p.ink, bg = p.panel },
    FloatBorder     = { fg = p.gray, bg = p.panel },
    FloatTitle      = { fg = p.blue, bg = p.panel, bold = true },
    ColorColumn     = { bg = p.cursorline },
    Cursor          = { fg = p.bg, bg = p.ink },
    CursorLine      = { bg = p.cursorline },
    CursorColumn    = { bg = p.cursorline },
    CursorLineNr    = { fg = p.ink, bold = true },
    LineNr          = { fg = p.linenr },
    SignColumn      = { bg = p.bg },
    FoldColumn      = { fg = p.linenr, bg = p.bg },
    Folded          = { fg = p.gray, bg = p.panel, italic = true },
    VertSplit       = { fg = p.split },
    WinSeparator    = { fg = p.split },
    Visual          = { bg = p.selection },
    VisualNOS       = { bg = p.selection },
    Search          = { fg = p.ink, bg = p.selection },
    IncSearch       = { fg = p.bg, bg = p.pink },
    CurSearch       = { fg = p.bg, bg = p.pink },
    MatchParen      = { bg = p.selection, bold = true },
    NonText         = { fg = p.linenr },
    Whitespace      = { fg = p.linenr },
    SpecialKey      = { fg = p.linenr },
    Conceal         = { fg = p.gray },
    Directory       = { fg = p.blue },
    Title           = { fg = p.blue, bold = true },
    EndOfBuffer     = { fg = p.bg },

    Pmenu           = { fg = p.ink, bg = p.panel },
    PmenuSel        = { fg = p.ink, bg = p.selection },
    PmenuSbar       = { bg = p.panel },
    PmenuThumb      = { bg = p.linenr },
    WildMenu        = { fg = p.bg, bg = p.blue },

    StatusLine      = { fg = p.ink, bg = p.split },
    StatusLineNC    = { fg = p.gray, bg = p.panel },
    TabLine         = { fg = p.gray, bg = p.panel },
    TabLineSel      = { fg = p.ink, bg = p.bg, bold = true },
    TabLineFill     = { bg = p.panel },
    QuickFixLine    = { bg = p.selection },

    ErrorMsg        = { fg = p.red },
    WarningMsg      = { fg = p.pink },
    MoreMsg         = { fg = p.cyan },
    ModeMsg         = { fg = p.ink, bold = true },
    Question        = { fg = p.cyan },

    -- ------------------------------------------------------ legacy syntax --
    Comment         = { fg = p.gray, italic = true },

    Constant        = { fg = p.pink },
    String          = { fg = p.red },
    Character       = { fg = p.red },
    Number          = { fg = p.pink },
    Float           = { fg = p.pink },
    Boolean         = { fg = p.pink },

    Identifier      = { fg = p.ink },
    Function        = { fg = p.cyan },

    Statement       = { fg = p.blue },
    Conditional     = { fg = p.blue },
    Repeat          = { fg = p.blue },
    Label           = { fg = p.blue },
    Operator        = { fg = p.ink },
    Keyword         = { fg = p.blue },
    Exception       = { fg = p.blue },

    PreProc         = { fg = p.blue },
    Include         = { fg = p.blue },
    Define          = { fg = p.blue },
    Macro           = { fg = p.blue },
    PreCondit       = { fg = p.blue },

    Type            = { fg = p.cyan },
    StorageClass    = { fg = p.blue },
    Structure       = { fg = p.cyan },
    Typedef         = { fg = p.cyan },

    Special         = { fg = p.red },
    SpecialChar     = { fg = p.red },
    Tag             = { fg = p.blue },
    Delimiter       = { fg = p.gray },
    SpecialComment  = { fg = p.gray, italic = true },
    Debug           = { fg = p.pink },

    Underlined      = { fg = p.blue, underline = true },
    Ignore          = { fg = p.linenr },
    Error           = { fg = p.red },
    Todo            = { fg = p.ink, bg = p.selection, bold = true },

    -- --------------------------------------------------------- Treesitter --
    ["@comment"]              = { link = "Comment" },
    ["@comment.documentation"] = { fg = p.gray, italic = true },
    ["@comment.error"]        = { fg = p.red },
    ["@comment.warning"]      = { fg = p.pink },
    ["@comment.todo"]         = { link = "Todo" },
    ["@comment.note"]         = { fg = p.cyan },

    ["@string"]               = { fg = p.red },
    ["@string.documentation"] = { fg = p.gray, italic = true },
    ["@string.escape"]        = { fg = p.red },
    ["@string.regexp"]        = { fg = p.red },
    ["@string.special"]       = { fg = p.red },
    ["@character"]            = { fg = p.red },
    ["@character.special"]    = { fg = p.red },

    ["@number"]               = { fg = p.pink },
    ["@number.float"]         = { fg = p.pink },
    ["@boolean"]              = { fg = p.pink },
    ["@constant"]             = { fg = p.pink },
    ["@constant.builtin"]     = { fg = p.pink }, -- None / True / False
    ["@constant.macro"]       = { fg = p.pink },

    ["@variable"]             = { fg = p.ink },
    ["@variable.builtin"]     = { fg = p.ink }, -- self / cls
    ["@variable.parameter"]   = { fg = p.ink },
    ["@variable.member"]      = { fg = p.ink },
    ["@property"]             = { fg = p.ink },
    ["@field"]                = { fg = p.ink },

    ["@function"]             = { fg = p.cyan },
    ["@function.call"]        = { fg = p.cyan },
    ["@function.method"]      = { fg = p.cyan },
    ["@function.method.call"] = { fg = p.cyan },
    ["@function.builtin"]     = { fg = p.ink }, -- print / len stay plain
    ["@function.macro"]       = { fg = p.cyan },
    ["@constructor"]          = { fg = p.cyan },

    ["@keyword"]              = { fg = p.blue },
    ["@keyword.function"]     = { fg = p.blue }, -- def / lambda
    ["@keyword.operator"]     = { fg = p.blue }, -- and / or / not / in / is
    ["@keyword.return"]       = { fg = p.blue },
    ["@keyword.import"]       = { fg = p.blue },
    ["@keyword.conditional"]  = { fg = p.blue },
    ["@keyword.repeat"]       = { fg = p.blue },
    ["@keyword.exception"]    = { fg = p.blue },
    ["@keyword.coroutine"]    = { fg = p.blue }, -- async / await
    ["@keyword.directive"]    = { fg = p.blue },

    ["@operator"]             = { fg = p.ink },
    ["@punctuation.delimiter"] = { fg = p.gray },
    ["@punctuation.bracket"]  = { fg = p.gray },
    ["@punctuation.special"]  = { fg = p.blue },

    ["@type"]                 = { fg = p.cyan },
    ["@type.builtin"]         = { fg = p.cyan },
    ["@type.definition"]      = { fg = p.cyan },
    ["@attribute"]            = { fg = p.blue }, -- decorators
    ["@attribute.builtin"]    = { fg = p.blue },
    ["@module"]               = { fg = p.ink },
    ["@namespace"]            = { fg = p.ink },
    ["@label"]                = { fg = p.blue },

    ["@tag"]                  = { fg = p.blue },
    ["@tag.attribute"]        = { fg = p.cyan },
    ["@tag.delimiter"]        = { fg = p.gray },

    -- markup (markdown, docstrings)
    ["@markup.heading"]       = { fg = p.blue, bold = true },
    ["@markup.strong"]        = { bold = true },
    ["@markup.italic"]        = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.raw"]           = { fg = p.cyan },
    ["@markup.raw.block"]     = { fg = p.cyan },
    ["@markup.link"]          = { fg = p.cyan, underline = true },
    ["@markup.link.label"]    = { fg = p.cyan },
    ["@markup.link.url"]      = { fg = p.gray, underline = true },
    ["@markup.list"]          = { fg = p.blue },
    ["@markup.quote"]         = { fg = p.red },

    ["@diff.plus"]            = { fg = p.cyan },
    ["@diff.minus"]           = { fg = p.red },
    ["@diff.delta"]           = { fg = p.pink },

    -- ---------------------------------------------- LSP semantic (pyright) --
    ["@lsp.type.class"]         = { fg = p.cyan },
    ["@lsp.type.enum"]          = { fg = p.cyan },
    ["@lsp.type.interface"]     = { fg = p.cyan },
    ["@lsp.type.struct"]        = { fg = p.cyan },
    ["@lsp.type.type"]          = { fg = p.cyan },
    ["@lsp.type.typeParameter"] = { fg = p.cyan },
    ["@lsp.type.function"]      = { fg = p.cyan },
    ["@lsp.type.method"]        = { fg = p.cyan },
    ["@lsp.type.decorator"]     = { fg = p.blue },
    ["@lsp.type.keyword"]       = { fg = p.blue },
    ["@lsp.type.namespace"]     = { fg = p.ink },
    ["@lsp.type.variable"]      = { fg = p.ink },
    ["@lsp.type.parameter"]     = { fg = p.ink },
    ["@lsp.type.property"]      = { fg = p.ink },
    ["@lsp.type.enumMember"]    = { fg = p.pink },
    ["@lsp.typemod.variable.readonly"] = { fg = p.pink }, -- constants
    ["@lsp.typemod.function.builtin"]  = { fg = p.ink },

    -- old-style treesitter groups still referenced by the user's config
    TSProperty  = { fg = p.ink },
    TSParameter = { fg = p.ink },

    -- --------------------------------------------------------- Diagnostics --
    DiagnosticError = { fg = p.red },
    DiagnosticWarn  = { fg = p.pink },
    DiagnosticInfo  = { fg = p.blue },
    DiagnosticHint  = { fg = p.gray },
    DiagnosticOk    = { fg = p.cyan },
    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = p.pink },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = p.blue },
    DiagnosticUnderlineHint  = { undercurl = true, sp = p.gray },
    DiagnosticUnnecessary    = { fg = p.dim }, -- unused code (LSP "unnecessary")
    DiagnosticDeprecated     = { fg = p.dim, strikethrough = true },
    ["@lsp.mod.unused"]      = { fg = p.dim },

    -- ----------------------------------------------------------- coc.nvim --
    CocInlayHint     = { fg = p.gray, italic = true },
    CocFadeOut       = { fg = p.dim },
    CocUnusedHighlight = { fg = p.dim },
    CocDeprecatedHighlight = { fg = p.dim, strikethrough = true },
    CocErrorSign     = { fg = p.red },
    CocWarningSign   = { fg = p.pink },
    CocInfoSign      = { fg = p.blue },
    CocHintSign      = { fg = p.gray },
    CocErrorFloat    = { fg = p.red, bg = p.panel },
    CocWarningFloat  = { fg = p.pink, bg = p.panel },
    CocInfoFloat     = { fg = p.blue, bg = p.panel },
    CocHintFloat     = { fg = p.gray, bg = p.panel },
    CocErrorHighlight   = { undercurl = true, sp = p.red },
    CocWarningHighlight = { undercurl = true, sp = p.pink },
    CocInfoHighlight    = { undercurl = true, sp = p.blue },
    CocHintHighlight    = { undercurl = true, sp = p.gray },
    CocFloating      = { link = "NormalFloat" },
    CocMenuSel       = { link = "PmenuSel" },

    -- git / diff
    DiffAdd    = { bg = "#e6f4ea" },
    DiffChange = { bg = "#eef2f8" },
    DiffDelete = { fg = p.linenr, bg = "#fbe9e7" },
    DiffText   = { bg = "#d6e7fb" },
    diffAdded   = { fg = p.cyan },
    diffRemoved = { fg = p.red },
    diffChanged = { fg = p.pink },

    -- misc plugins the user has (NERDTree uses Directory/Normal already)
    gitcommitSummary = { fg = p.ink },
    gitcommitComment = { fg = p.gray, italic = true },
  }

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  -- Bundle the Treesitter setup so user configs stay clean (no-op without it).
  require("pustota.treesitter").setup()

  -- Terminal palette (best effort within the limited color set).
  vim.g.terminal_color_0  = p.ink
  vim.g.terminal_color_1  = p.red
  vim.g.terminal_color_2  = p.cyan
  vim.g.terminal_color_3  = p.pink
  vim.g.terminal_color_4  = p.blue
  vim.g.terminal_color_5  = p.pink
  vim.g.terminal_color_6  = p.cyan
  vim.g.terminal_color_7  = p.gray
  vim.g.terminal_color_8  = p.gray
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.cyan
  vim.g.terminal_color_11 = p.pink
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.pink
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.ink
end

return M
