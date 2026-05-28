-- Keymaps are loaded on LazyVim's VeryLazy event.

local map = vim.keymap.set

-- Leave insert mode quickly.
map("i", "jj", "<Esc>", { desc = "Exit insert mode", silent = true })

-- Formatting. Keep your original <leader>f muscle memory.
map({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer or selection" })

-- LSP helpers. LazyVim already provides richer mappings; these keep your preferred basics explicit.
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
