-- Basic options set
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "va"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.timeoutlen = 500
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

if vim.g.vscode == nil then
  -- Non-Vscode settings
  vim.opt.termguicolors = true
  vim.opt.expandtab = true
  vim.opt.wrap = false
  vim.opt.smartcase = true
  vim.opt.swapfile = false
  vim.opt.backup = false
  vim.opt.undodir = "~/.vim/undodir"
  vim.opt.incsearch = true
  vim.opt.timeoutlen = 400

  vim.cmd([[colorscheme carbonfox]])
  vim.opt.background = "dark"

  vim.g.highlighturl_enabled = true
else
end
