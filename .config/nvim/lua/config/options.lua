-- Options are loaded before lazy.nvim startup.
-- LazyVim already sets sensible defaults, so keep this file focused on personal preferences.

-- Language ---------------------------------------------------------------
pcall(vim.cmd, "language ja_JP.UTF-8")

-- Files ------------------------------------------------------------------
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.hidden = true

-- UI ---------------------------------------------------------------------
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.cmdheight = 1
vim.opt.showcmd = true
vim.opt.visualbell = true
vim.opt.showmatch = true
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.virtualedit:append("block")

-- Clipboard --------------------------------------------------------------
vim.opt.clipboard:append({ "unnamedplus" })

-- Completion / command line ---------------------------------------------
vim.opt.wildmenu = true

-- Search -----------------------------------------------------------------
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.matchtime = 1

-- Indent -----------------------------------------------------------------
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Invisible characters ---------------------------------------------------
vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  tab = "»·",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
}

-- Spell ------------------------------------------------------------------
vim.opt.spelllang = { "en", "cjk" }

-- Diagnostics ------------------------------------------------------------
vim.diagnostic.config({
  severity_sort = true,
})
