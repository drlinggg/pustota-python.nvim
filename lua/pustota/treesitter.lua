-- Treesitter bootstrap bundled with the colorscheme.
--
-- The theme highlights through Treesitter capture groups (@string, @keyword,
-- @function.builtin, @type, ...), so it ships the parser install and the
-- per-filetype activation here to keep user configs clean. nvim-treesitter
-- itself stays an external dependency installed by the user's plugin manager;
-- if it is missing, this is a no-op.
local M = {}

function M.setup()
  if vim.g.loaded_pustota_treesitter then
    return
  end

  local ok, ts = pcall(require, "nvim-treesitter")
  if not ok then
    return
  end
  vim.g.loaded_pustota_treesitter = true

  -- Ensure parsers are present (installs only the missing ones).
  ts.install({
    "python", "lua", "vim", "vimdoc", "bash",
    "json", "yaml", "toml", "markdown", "markdown_inline",
    "go", "sql",
  })

  -- .env files get filetype 'env', which has no dedicated parser; reuse the
  -- bash parser (dotenv is essentially KEY=value shell assignments).
  vim.treesitter.language.register("bash", "env")

  -- The main branch does not auto-enable highlighting; start it per filetype.
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("PustotaTreesitter", { clear = true }),
    pattern = {
      "python", "lua", "vim", "help", "sh", "bash",
      "json", "yaml", "toml", "markdown",
      "go", "sql", "env",
    },
    callback = function()
      pcall(vim.treesitter.start)
      -- Experimental treesitter-based indentation.
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

return M
