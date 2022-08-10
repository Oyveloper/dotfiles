require("lsp-format").setup({
	exclude = { "sqls" },
	sync = true,
})

-- require("lspconfig").gopls.setup({ on_attach = require("lsp-format").on_attach })

-- require("lspconfig").efm.setup({
-- 	on_attach = require("lsp-format").on_attach,
-- 	init_options = { documentFormatting = false },
-- 	settings = {
-- 		languages = {
-- 			typescript = { prettier },
-- 			yaml = { prettier },
-- 		},
-- 	},
-- })
