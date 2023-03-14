local function lualineSetup()
  local theme_name = vim.g.colors_name
  require("lualine").setup({
    options = {
      theme = theme_name,
    },
    sections = {
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
      },
    },
  })
end

vim.api.nvim_create_autocmd({ "SessionLoadPost", "ColorScheme" }, {
  callback = function()
    lualineSetup()
  end,
})

lualineSetup()
