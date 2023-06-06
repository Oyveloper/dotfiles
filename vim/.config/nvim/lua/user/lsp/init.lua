--[[ local status_ok, _ = pcall(require, "lspconfig") ]]
--[[ if not status_ok then ]]
--[[ 	return ]]
--[[ end ]]
--[[]]
--[[ require("user.lsp.lsp-installer") ]]
--[[ require("user.lsp.handlers").setup() ]]
--[[ require("user.lsp.signature") ]]
--[[ require("user.lsp.null-ls") ]]
--[[ require("user.lsp.lsp-format") ]]
--[[ require("user.lsp.settings.volar") ]]

local lsp = require("lsp-zero")
local lsp_format = require("lsp-format")
require("lspfuzzy").setup({})
lsp_format.setup({
  exclude = { "sqls" },
  sync = true,
})

require("user.lsp.null-ls")

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "eslint",
  "pyright",
  "rust_analyzer",
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = "local",
  sign_icons = {
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "",
  },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<C-j>"] = cmp.mapping.select_next_item(),
  ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
  ["<C-c>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ["<C-e>"] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ["<CR>"] = cmp.mapping.confirm({ select = true }),
})
--[[ 	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select), ]]
--[[ 	["<C-n>"] = cmp.mapping.select_next_item(cmp_select), ]]
--[[ 	["<C-y>"] = cmp.mapping.confirm({ select = true }), ]]
--[[ 	["<C-Space>"] = cmp.mapping.complete(), ]]
--[[ }) ]]

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "buffer",   keyword_length = 1 },
    { name = "luasnip",  keyword_length = 1 },
  },
  formatting = {
    fields = { "menu", "abbr", "kind" },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = "λ",
        vsnip = "⋗",
        buffer = "Ω",
        path = "🖫",
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

vim.diagnostic.config({
  virtual_text = true,
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  lsp_format.on_attach(client, bufnr)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.keymap.set("n", "gd", ":Telescope lsp_definitions theme=cursor<CR>", opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "gi", ":Telescope lsp_implementations theme=cursor<CR>", opts)
  vim.keymap.set("n", "<C-p>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  vim.keymap.set("n", "ga", "<cmd>CodeActionMenu<CR>", opts)
  -- vim.keymap.set( "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.keymap.set("n", "gn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>zz', opts)
  vim.keymap.set("n", "gp", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>zz', opts)
  vim.keymap.set("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
  vim.keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = false})' ]])
end)

lsp.configure("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})
local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local rust_lsp = lsp.build_options("rust_analyzer", {})
require("rust-tools").setup({
  server = rust_lsp,
  --[[ dap = { ]]
  --[[   adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path), ]]
  --[[ }, ]]
})

lsp.setup()
