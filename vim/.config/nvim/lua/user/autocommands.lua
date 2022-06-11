if vim.g.vscode == nil then
	vim.cmd([[
  autocmd VimEnter * WhichKey<CR>
]])

	vim.cmd([[autocmd BufWritePre, FileWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
end
