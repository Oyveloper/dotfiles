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

	-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
	vim.cmd([[colorscheme gruvbox-material]])

	vim.g.highlighturl_enabled = true
else
	-- Vscode settings
	vim.cmd([[
  nnoremap <leader>ff <Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>
  nmap <leader>pp <Cmd>call VSCodeNotify("workbench.action.showCommands")
  nnoremap gs <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
  nnoremap <leader>gg <Cmd>call VSCodeNotify('magit.status')<CR>
  nnoremap <leader>op <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
  nnoremap <leader>oc <Cmd>call VSCodeNotify('workbench.action.closeSidebar')<CR>
  nnoremap <leader>en <Cmd>call VkCodeNotify('editor.action.marker.next')<CR>

  nnoremap <leader>wL <Cmd>call VSCodeNotify('workbench.action.moveEditorToNextGroup')<CR>
  nnoremap <leader>wH <Cmd>call VSCodeNotify('workbench.action.moveEditorToPreviousGroup')<CR>
  nnoremap <leader>wJ <Cmd>call VSCodeNotify('workbench.action.splitDown')<CR>
  nnoremap <leader>r <Cmd>call VSCodeNotify('editor.action.refactor')<CR>

  nnoremap <leader>pr <Cmd>call VSCodeNotify('workbench.action.debug.start')<CR>

  ]])
end
