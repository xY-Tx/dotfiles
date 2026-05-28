-- Autocmds are loaded on LazyVim's VeryLazy event.
-- Keep this file for small editing behaviors that are not options or keymaps.

local augroup = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Create parent directories automatically before writing a new file.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function(event)
    local file = event.match
    if file == "" or file:match("^%w%w+://") then
      return
    end

    local dir = vim.fn.fnamemodify(file, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Remove trailing whitespace for code files where it is usually accidental.
-- Markdown is intentionally excluded because two trailing spaces can mean a hard line break.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = { "*.lua", "*.sh", "*.bash", "*.zsh" },
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- Resize splits when the terminal/window size changes.
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Terminal buffers feel better without numbers and in insert mode.
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- Do not automatically continue comments when pressing Enter or o/O.
local augroup = vim.api.nvim_create_augroup("user_formatoptions", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})
