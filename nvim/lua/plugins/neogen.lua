return {
  "danymat/neogen",
  config = function()
    require("neogen").setup {
      enabled = true,
      input_after_comment = true,
      snippet_engin = "luasnip",
    }
  end,
}
