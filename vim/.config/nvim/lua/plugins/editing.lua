return {
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup()
    end,
    lazy = false,
  },

  {
    "DanielWeidinger/nvim-sshfs",
    lazy = false,
    opts = function()
      require("sshfs").setup({
        mnt_base_dir = vim.fn.expand("$HOME") .. "/mnt",
        width = 0.6,       -- host window width
        height = 0.5,      -- host window height
        connection_icon = "✓", -- icon for connection indication
      })
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = {},
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["markdown"] = { { "prettierd", "prettier" } },
        ["markdown.mdx"] = { { "prettierd", "prettier" } },
        ["javascript"] = { "dprint" },
        ["javascriptreact"] = { "dprint" },
        ["typescript"] = { "dprint" },
        ["typescriptreact"] = { "dprint" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
        dprint = {
          condition = function(ctx)
            return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
