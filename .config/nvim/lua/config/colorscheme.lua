-- Active colorscheme.
-- Change this one value when you want to switch themes.
--
-- Examples:
--   "neonwave"
--   "kintsugi-dark"
--   "kintsugi-flared"
--   "catppuccin-frappe"
--   "catppuccin-latte"
--   "catppuccin-mocha"
--   "catppuccin-macchiato"
--   "tokyonight"
--   "tokyonight-storm"
--   "tokyonight-night"
--   "tokyonight-moon"
--   "tokyonight-day"
--   "nord"
--   "thorn-dark-cold"
--   "thorn-dark-warm"
--   "thorn-light-cold"
--   "thorn-light-warm"
--   "kanagawa-wave"
--   "kanagawa-dragon"
--   "kanagawa-lotus"
--   "dracula"
--   "dracula-soft"
--   "rose-pine"
--   "rose-pine-main"
--   "rose-pine-moon"
--   "rose-pine-dawn"

local colorscheme = "neonwave"

-- Try to apply the selected colorscheme.
-- pcall keeps Neovim from failing hard if the theme is missing,
-- misspelled, or temporarily unavailable during setup.
local ok, err = pcall(vim.cmd.colorscheme, colorscheme)

if ok then
  -- Some colorschemes, such as neonwave, may apply correctly but leave
  -- vim.g.colors_name unset. Set it only when the theme did not.
  vim.g.colors_name = vim.g.colors_name or colorscheme
  return
end

-- Notify the failure, then try safe fallbacks.
vim.notify(("Failed to load colorscheme '%s': %s"):format(colorscheme, err), vim.log.levels.WARN)

-- First fallback: LazyVim's default theme.
if pcall(vim.cmd.colorscheme, "tokyonight") then
  vim.g.colors_name = vim.g.colors_name or "tokyonight"
  return
end

-- Last fallback: built-in Neovim colorscheme.
vim.cmd.colorscheme("habamax")
vim.g.colors_name = vim.g.colors_name or "habamax"
