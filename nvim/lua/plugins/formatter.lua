return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        javascript = {
          require("formatter.filetypes.javascript").prettierd,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettierd,
        },
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettierd,
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettierd,
        },
        html = {
          require("formatter.filetypes.html").prettierd,
        },
        css = {
          require("formatter.filetypes.css").prettierd,
        },
        scss = {
          require("formatter.filetypes.css").prettierd,
        },
      },
      ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace
      }
    })
  end
}
