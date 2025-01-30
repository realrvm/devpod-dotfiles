return {
  {
    {
      "nvim-treesitter/nvim-treesitter",
      build = function()
        require("nvim-treesitter.install").update { with_sync = true }
      end,
      dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "nvim-lua/plenary.nvim" },
    { "neovim/nvim-lspconfig" },
    {
      "williamboman/mason.nvim",
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP
      "onsails/lspkind-nvim",
    },
    {
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
      "L3MON4D3/LuaSnip", -- Snippets plugin
    },
    {
      "Exafunction/codeium.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
      },
      config = function()
        require("codeium").setup {}
      end,
    },
    {
      "amitds1997/remote-nvim.nvim",
      version = "*", -- Pin to GitHub releases
      dependencies = {
        "nvim-lua/plenary.nvim", -- For standard functions
        "MunifTanjim/nui.nvim", -- To build the plugin UI
        "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
      },
      config = true,
    },
    {
      "chrisgrieser/nvim-recorder",
      dependencies = "rcarriga/nvim-notify", -- optional
      opts = {},
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "lyokha/vim-xkbswitch" },
  },
}
