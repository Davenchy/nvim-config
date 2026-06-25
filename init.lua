-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." }
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.cmd.packadd("termdebug")
vim.cmd.packadd("nvim.difftool")
vim.cmd.packadd("nvim.undotree")

require("options")
require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = true, notify = false, frequency = 24 * 60 * 60 }
})

-- load modules in sequence without interruption on error
local modules = { "keymaps", "lsp", "commands" }
for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  if not ok then
    vim.notify(
      ("Failed to load module %s\n%s"):format(mod, err),
      vim.log.levels.ERROR
    )
  end
end
