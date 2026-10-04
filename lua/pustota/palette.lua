-- Color palette for pustota.nvim.
--
-- A super-light, minimalist theme: a literally white background and only
-- five ink/accent colors. Two blacks carry most of the text, a single pink
-- marks every literal, and two blues (a strong blue + a lighter blue)
-- separate structure (keywords) from names (functions/types).
return {
  bg    = "#ffffff", -- literally white background
  ink   = "#24292e", -- black #1: text, variables, operators, builtins
  gray  = "#666d78", -- black #2: comments, punctuation, line numbers
  dim   = "#868d98", -- faded-out / unused code (coc CocFadeOut, unused vars)
  red   = "#c0392b", -- strings, chars, escapes
  pink  = "#c15a86", -- numbers, booleans, None, constants
  blue  = "#0a3d91", -- keywords: def/class/return/import/control, decorators
  cyan  = "#0e74c0", -- light blue: function, class and type names

  -- Derived light UI shades (neutral chrome, not part of the syntax palette).
  selection  = "#d6e7fb", -- visual selection (light-blue tint)
  cursorline = "#f4f5f7", -- current line highlight
  panel      = "#f1f3f5", -- popup / menu background
  linenr     = "#c2c7cf", -- inactive line numbers
  split      = "#e2e5e9", -- separators, inactive statusline
}
