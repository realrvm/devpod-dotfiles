return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons", -- optional, for file icons
  },
  tag = "nightly", -- optional, updated every week. (see issue #1193)
  config = function()
    require("nvim-tree").setup {
      view = {
        mappings = {
          custom_only = true,
          list = {
            { key = { "o", "<cr>" }, action = "edit" },
            { key = "a", action = "create" },
            { key = "d", action = "trash" },
            { key = "r", action = "rename" },
            { key = "c", action = "copy" },
            { key = "p", action = "paste" },
            { key = "y", action = "copy_name" },
            { key = "q", action = "close" },
            { key = "<C-v>", action = "vsplit" },
            { key = "<C-x>", action = "split" },
            { key = "<C-t>", action = "tabnew" },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    }
  end,
}
