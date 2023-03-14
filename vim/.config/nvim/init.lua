vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("user.lazy")
require("user.comment")
require("user.keymap")
require("user.options")
require("user.switch")
if vim.g.vscode ~= nil then
  -- Things required in vscode
  require("user.vscode")
else
  --Things not required in Vscode
  require("user.lsp")
  require("user.autocommands")
  require("user.autopairs")
  require("user.telescope")
  require("user.treesitter")
  require("user.nvimtree")
  require("user.impatient")
  require("user.alpha")
  require("user.toggleterm")
  require("user.project")
  require("user.dressing")
  require("user.catppuccin")
  require("user.vscode-theme")
  require("user.lualine")
  require("user.colorizer")
  require("user.gitsigns")
  require("user.bufferline")
  require("user.cursorline")
  require("user.dap")
end
