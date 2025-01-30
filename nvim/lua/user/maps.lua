-- variables
local bind = vim.keymap.set
local default_options = { silent = true }
local expr_options = { expr = true }

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- buffer
bind("n", "<leader>n", "<cmd>bn<cr>")
bind("n", "<leader>b", "<cmd>bp<cr>")
bind("n", "<leader>d", "<cmd>bw<cr>")

-- save
bind("n", "<leader>w", "<cmd>write<cr>")
bind({ "n", "x" }, "x", '"_x')

-- move
bind({ "n", "v" }, "j", "gj")
bind({ "n", "v" }, "k", "gk")
bind({ "n", "i" }, "<c-h>", "<c-w>h")
bind({ "n", "i" }, "<c-j>", "<c-w>j")
bind({ "n", "i" }, "<c-k>", "<c-w>k")
bind({ "n", "i" }, "<c-l>", "<c-w>l")
bind("", "<C-u>", "<C-u>M")
bind("", "<C-d>", "<C-d>M")
bind("i", "OO", "<cr><C-o>O", { noremap = true, silent = true })
bind("i", "kk", "<Esc>l%%a")

-- helpers
bind("n", "<leader>y", "y$")
bind("n", "<leader>m", "50%<cr>")
bind("i", ";;", "<C-O>A;")
bind("n", "<leader>dd", ":w !diff % -<cr>", { desc = "diff unsaved changes" })
bind("n", "yc", "<cmd>norm yygc<cr>p", { noremap = true, desc = "Duplicate line and comment original" })

-- switch tabs
bind("n", "<c-left>", "<cmd>tabprevious<cr>")
bind("n", "<c-right>", "<cmd>tabnext<cr>")

-- highlight
bind("n", "<cr>", "<cmd>nohl<cr>")

-- center search items
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")
bind("c", "<CR>", function()
  return vim.fn.getcmdtype() == "/" and "<CR>zzzv" or "<CR>"
end, expr_options)

-- paste over currently selected text without yanking it
bind("v", "p", '"_dp', default_options)

-- go to definition open in a new tab
bind("n", "gt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})

-- prevent inserting blank lines
bind("n", "dd", function()
  if vim.fn.getline "." == "" then
    return '"_dd'
  end
  return "dd"
end, { expr = true })

-- fix word under cursor
bind("n", "za", "1z=")

-- Esc in normal mode
bind("n", "<Esc>", ":nohl<CR>:echo<CR>")

-- make zsh files recognized as sh for bash-ls & treesitter
vim.filetype.add {
  extension = {
    zsh = "sh",
    sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
  },
  filename = {
    [".zshrc"] = "sh",
    [".zshenv"] = "sh",
  },
}

-- cmd
-- format
vim.cmd "nnoremap  <Leader>f :Format<CR>"

-- reselect pasted text
vim.cmd "nnoremap  gp `[v`]"

-- xkb-switch
vim.cmd [[let g:XkbSwitchEnabled = 1]]

-- nvim-tree
vim.cmd [[map <C-n> :NvimTreeToggle<CR>]]

--
vim.cmd [[
 autocmd BufWritePre * %s/\s\+$//e
 autocmd BufWritePre * %s/\n\+\%$//e
 autocmd BufWritePre *.[ch] %s/\%$/\r/e
 ]]

-- scrollbind
-- vim.cmd "nnoremap <C-m> :windo set scb<CR><C-s>:windo set noscb<CR>"
