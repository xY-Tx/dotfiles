-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- jjでインサートモードからノーマルモードに変更
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>f", function()
  require("conform").format()
end, { desc = "Format (shfmt)" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
