require("lsp-format").setup({
	exclude = { "sqls" },
	sync = true,
})

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

if not configs.wgsl_analyzer then
	configs.wgsl_analyzer = {
		default_config = {
			cmd = { vim.fn.expand("$HOME") .. "/.cargo/bin/wgsl_analyzer" },
			filetypes = { "wgsl" },
			root_dir = lspconfig.util.root_pattern(".git", "wgsl"),
			settings = {},
		},
	}
end

lspconfig.wgsl_analyzer.setup({
	on_attach = function(client)
		print("hello wgsl")
		require("lsp-format").on_attach(client)
	end,
})

require("lspconfig").gopls.setup({ on_attach = require("lsp-format").on_attach })

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
