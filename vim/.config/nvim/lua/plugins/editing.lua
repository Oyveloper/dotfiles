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
        width = 0.6, -- host window width
        height = 0.5, -- host window height
        connection_icon = "✓", -- icon for connection indication
      })
    end,
  },
}
