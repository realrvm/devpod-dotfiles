return {
  "max397574/better-escape.nvim",
  tag = "v1.0.0",
  config = function()
    require("better_escape").setup {
      mapping = { "jk", "jj" },
      timeout = vim.o.timeoutlen,
      clear_empty_lines = false,
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
      end,
    }
  end,
}
