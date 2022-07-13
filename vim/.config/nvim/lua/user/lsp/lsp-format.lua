require("lsp-format").setup({
  exclude = {"sqls"}
})

local prettier = {
	formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
	formatStdin = true,
}
require("lspconfig").efm.setup({
	on_attach = require("lsp-format").on_attach,
	init_options = { documentFormatting = true },
	settings = {
		languages = {
			typescript = { prettier },
			yaml = { prettier },
		},
	},
})
