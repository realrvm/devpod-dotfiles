return {
  "glepnir/lspsaga.nvim",
  config = function()
    require("lspsaga").setup {
      server_filetype_map = {
        typescript = "typescript",
        javascript = "javascript",
        html = "html",
        css = { "css", "scss" },
      },
      diagnostic = {
        max_width = 0.8,
        keys = {
          quit = { "q", "<ESC>" },
        },
      },
    }
  end,
}
