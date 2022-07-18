require("user.plugins")
require("user.comment")
require("user.autocommands")
require("user.autopairs")
require("user.keymap")
require("user.options")
if vim.g.vscode ~= nil then
  -- Things required in vscode
  require("user.vscode")
else
  --Things not required in Vscode
  require("user.cmp")
  require("user.lsp")
  require("user.telescope")
  require("user.treesitter")
  require("user.nvimtree")
  require("user.bufferline")
  -- lua require ('user.whichkey')
  require("user.impatient")
  require("user.alpha")
  require("user.reload")
  require("user.toggleterm")
  require("user.project")
  require("user.dressing")
  require("user.catppuccin")
  require("user.feline")
end
