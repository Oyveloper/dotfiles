local function lualineSetup()
	local theme_name = vim.g.colors_name
	require("lualine").setup({
		options = {
			theme = theme_name,
		},
	})
end

vim.api.nvim_create_autocmd({ "SessionLoadPost", "ColorScheme" }, {
	callback = function()
		lualineSetup()
	end,
})

lualineSetup()
