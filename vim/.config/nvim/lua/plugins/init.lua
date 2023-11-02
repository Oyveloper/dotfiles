local vscodefun = function()
  return vim.g.vscode == nil
end

return {
  {
    "tpope/vim-surround",
    lazy = false,
  },
  { "AndrewRadev/switch.vim",              lazy = false },
  -- {
  --   "asvetliakov/vim-easymotion",
  --   cond = function()
  --     return not vscodefun()
  --   end,
  --   name = "vsc-easymotion",
  --   lazy = false,
  -- },
  {
    "easymotion/vim-easymotion",
    -- cond = vscodefun,
    lazy = false,
  },
  --Things not required in Vscode
  --

  -- My plugins here
  { "wbthomason/packer.nvim",              cond = vscodefun }, -- Have packer manage itself
  { "nvim-lua/plenary.nvim",               cond = vscodefun, lazy = false }, --  ,lua functions  ,ny lots of plugins
  { "nvim-lua/popup.nvim",                 cond = vscodefun }, -- An implementation of the Popup API from vim in Neovim
  { "windwp/nvim-autopairs",               cond = vscodefun, lazy = false }, -- Autopairs, integrates with both cmp and treesitter
  { "tpope/vim-commentary",                lazy = false },
  { "kyazdani42/nvim-web-devicons",        cond = vscodefun, lazy = false },
  { "kyazdani42/nvim-tree.lua",            cond = vscodefun },
  { "famiu/bufdelete.nvim",                cond = vscodefun, lazy = false }, -- better bufdelete

  { "akinsho/bufferline.nvim",             cond = vscodefun, lazy = false },
  { "nvim-lualine/lualine.nvim",           cond = vscodefun },
  { "akinsho/toggleterm.nvim",             cond = vscodefun, lazy = false },
  { "ahmedkhalf/project.nvim",             cond = vscodefun },
  { "lukas-reineke/indent-blankline.nvim", cond = vscodefun, lazy = false },
  { "goolord/alpha-nvim",                  cond = vscodefun },
  { "folke/which-key.nvim",                cond = vscodefun, lazy = false },

  -- Colorschemes
  { "martinsione/darkplus.nvim",           cond = vscodefun, cond = vscodefun, lazy = false },
  { "NTBBloodbath/doom-one.nvim",          cond = vscodefun, lazy = false },
  { "morhetz/gruvbox",                     cond = vscodefun, lazy = false },
  { "joshdick/onedark.vim",                cond = vscodefun, lazy = false },
  "lunarvim/Onedarker.nvim",

  { "arcticicestudio/nord-vim",      cond = vscodefun, lazy = false },
  { "EdenEast/nightfox.nvim",        cond = vscodefun, lazy = false },
  { "tomasiser/vim-code-dark",       cond = vscodefun, lazy = false },
  { "sonph/onehalf",                 rtp = "vim",      cond = vscodefun, lazy = false },
  { "drewtempelmeyer/palenight.vim", cond = vscodefun, lazy = false },
  { "sainnhe/gruvbox-material",      cond = vscodefun, lazy = false },
  { "ntk148v/vim-horizon",           cond = vscodefun, lazy = false },
  { "NLKNguyen/papercolor-theme",    cond = vscodefun, lazy = false },
  {
    "Mofiqul/vscode.nvim",
    cond = vscodefun,
    lazy = false,
  },
  {
    "olivercederborg/poimandres.nvim",
    opts = function()
      require("poimandres").setup({
        -- leave this setup function empty for default opts
        -- or refer to the optsuration section
        -- for optsuration options
      })
    end,
    cond = vscodefun,
    lazy = false,
  },

  {
    "catppuccin/nvim",
    as = "catppuccin",
    cond = vscodefun,
  },

  { "NvChad/base46",                 cond = vscodefun },

  -- cmp plugins
  --[[ { "hrsh7th/nvim-cmp" }, -- The completion plugin ]]
  --[[ { "hrsh7th/cmp-buffer" }, -- buffer completions ]]
  --[[ { "hrsh7th/cmp-path" }, -- path completions ]]
  --[[ { "hrsh7th/cmp-cmdline" }, -- cmdline completions ]]
  --[[ { "saadparwaiz1/cmp_luasnip" }, -- snippet completions ]]
  --[[ use({ "hrsh7th/cmp-nvim-lsp" }) ]]
  --[[ use({ "hrsh7th/cmp-nvim-lsp-signature-help" }) ]]
  --[[ use({ "simrat39/rust-tools.nvim" }) ]]
  { "simrat39/rust-tools.nvim",      cond = vscodefun }, -- temporary fix for rust-tools errors
  { "lukas-reineke/lsp-format.nvim", cond = vscodefun },
  { "rcarriga/nvim-notify",          cond = vscodefun },
  {
    "ojroques/nvim-lspfuzzy",
    dependencies = {
      { "junegunn/fzf" },
      { "junegunn/fzf.vim" }, -- to enable preview (optional)
    },
    cond = vscodefun,
  },

  -- LSP
  --
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
    cond = vscodefun,
  },
  { "jose-elias-alvarez/null-ls.nvim", cond = vscodefun }, -- for formatters and linters
  --[[ { ]]
  --[[ 	"ray-x/lsp_signature.nvim", ]]
  --[[ }, ]]
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    cond = vscodefun,
  },

  -- Copilot
  { "github/copilot.vim",              cond = vscodefun, lazy = false }, --Copilot

  -- Telescope
  { "nvim-telescope/telescope.nvim",   cond = vscodefun },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vscodefun,
  }, -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cond = vscodefun,
  },
  { "nvim-treesitter/nvim-treesitter-context",     cond = vscodefun },
  { "JoosepAlviste/nvim-ts-context-commentstring", cond = vscodefun },
  --{ "p00f/nvim-ts-rainbow", cond = vscodefun, lazy = false },
  { "windwp/nvim-ts-autotag",                      cond = vscodefun, lazy = false },
  { "nvim-treesitter/nvim-treesitter-textobjects", cond = vscodefun, lazy = false },
  { "nvim-telescope/telescope-file-browser.nvim",  cond = vscodefun },

  -- Lua
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = function()
      require("todo-comments").setup({
        -- your optsuration comes here
        -- or leave it empty to  ,the default settings
        -- refer to the optsuration section below
      })
    end,
    cond = vscodefun,
  },

  --[[ { ]]
  --[[   "aserowy/tmux.nvim", ]]
  --[[   opts = function() ]]
  --[[     require("tmux").setup({ ]]
  --[[       -- overwrite default optsuration ]]
  --[[       -- here, e.g. to enable default bindings ]]
  --[[       copy_sync = { ]]
  --[[         -- enables copy sync and overwrites all register actions to ]]
  --[[         -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance ]]
  --[[         enable = true, ]]
  --[[       }, ]]
  --[[       navigation = { ]]
  --[[         -- enables default keybindings (C-hjkl) for normal mode ]]
  --[[         enable_default_keybindings = true, ]]
  --[[         cycle_navigation = true, ]]
  --[[       }, ]]
  --[[       resize = { ]]
  --[[         -- enables default keybindings (A-hjkl) for normal mode ]]
  --[[         enable_default_keybindings = false, ]]
  --[[       }, ]]
  --[[     }) ]]
  --[[   end, ]]
  --[[   cond = vscodefun, ]]
  --[[   lazy = false, ]]
  --[[ }, ]]

  -- Git
  { "lewis6991/gitsigns.nvim",     cond = vscodefun },
  { "kdheepak/lazygit.vim",        cond = vscodefun, lazy = false },

  --{ "yorickpeterse/nvim-window.git", cond = vscodefun },

  -- Highlight colors
  { "norcalli/nvim-colorizer.lua", cond = vscodefun },

  { "stevearc/dressing.nvim",      cond = vscodefun },

  { "yamatsum/nvim-cursorline",    cond = vscodefun },

  -- Firevim
  {
    "glacambre/firenvim",
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    cond = vscodefun,
  },

  -- Dap
  --
  { "mfussenegger/nvim-dap",           cond = vscodefun },
  { "rcarriga/nvim-dap-ui",            cond = vscodefun },
  { "theHamsta/nvim-dap-virtual-text", cond = vscodefun },
  { "ldelossa/nvim-dap-projects",      cond = vscodefun },
  {
    "mfussenegger/nvim-dap-python",
    cond = vscodefun,
    opts = function()
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
      require("dap-python").test_runner = "pytest"
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = function()
      require("trouble").setup({
        -- your optsuration comes here
        -- or leave it empty to  ,the default settings
        -- refer to the optsuration section below
      })
    end,
    cond = vscodefun,
  },
  {
    "folke/lsp-colors.nvim",
    opts = function()
      require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981",
      })
    end,
    cond = vscodefun,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
}
