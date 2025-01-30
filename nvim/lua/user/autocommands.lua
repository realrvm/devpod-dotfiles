-- variables
local autocmd = vim.api.nvim_create_autocmd
local YankHighlightGrp = vim.api.nvim_create_augroup("YankHighlightGrp", {})

-- Relative numbers
autocmd("CmdlineEnter", {
  pattern = "*",
  command = "set norelativenumber|redraw",
})

autocmd("CmdlineLeave", {
  pattern = "*",
  command = "set relativenumber",
})

-- Turn off paste mode when leaving insert
autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

autocmd("BufWinLeave", {
  pattern = "?*",
  command = "mkview",
})

autocmd("BufWinEnter", {
  pattern = "?*",
  command = "silent! loadview",
})

autocmd("FileType", {
  pattern = "?*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

autocmd("TextYankPost", {
  group = YankHighlightGrp,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 100,
    }
  end,
})

autocmd({ "QuitPre" }, {
  callback = function()
    vim.cmd "NvimTreeClose"
  end,
})
