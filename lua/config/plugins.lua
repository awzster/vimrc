-- lua/config/plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "folke/lazy.nvim", version = false },

  -- базовые
  { "drmingdrmer/xptemplate" },
  { "tpope/vim-surround" },
  { "andymass/vim-matchup" },
  { "osyo-manga/vim-anzu" },
  { "skywind3000/asyncrun.vim" },
  { "kshenoy/vim-signature" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- пары и теги
  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },

  -- темы
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "sainnhe/everforest", lazy = true, priority = 1000 },
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000 },
  { "tanvirtin/monokai.nvim", lazy = true, priority = 1000 },

  -- UI
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" } },

  -- diagnostics
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

  -- cmp
  { "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
    },
  },

  -- форматирование
  { "stevearc/conform.nvim", event = "VeryLazy" },

  -- LSP
  { "williamboman/mason.nvim" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim", "nvim-lspconfig" } },
})

