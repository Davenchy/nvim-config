require("vim._core.ui2").enable({})
vim.g.netrw_banner = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.background = "dark"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.breakindent = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

vim.opt.confirm = true
vim.opt.clipboard:prepend("unnamedplus")
vim.opt.isfname:append("@-@")
vim.opt.guicursor = ""
vim.opt.scrolloff = 5

vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.termguicolors = true

vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.hidden = true
vim.opt.wildmode:append({ "longest", "full" })
vim.opt.wildoptions:append({ "fuzzy", "pum" })
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.hlsearch = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.spell = true

vim.opt.foldenable = true
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.o.winborder = "rounded"

vim.diagnostic.config({
  virtual_lines = true,
  underline = true,
  signs = true,
})
