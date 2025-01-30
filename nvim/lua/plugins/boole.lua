return {
  "nat-418/boole.nvim",
  config = function()
    require("boole").setup {
      mappings = {
        increment = "<C-a>",
        decrement = "<C-x>",
      },
      additions = {
        { "const", "let", "var" },
        { "rony", "klosha", "motya", "klushka" },
        { "import", "export" },
        { "private", "public", "protected" },
        { "undefined", "null" },
      },
      allow_caps_additions = {
        { "enable", "disable" },
      },
    }
  end,
}
