-- variables
local bind = vim.keymap.set
local rainbow_delimiters = require "rainbow-delimiters"
local opts = { noremap = true, silent = true }

-- telescope
pcall(require("telescope").load_extension, "fzf")

bind(
  "n",
  "<leader>fr",
  require("telescope.builtin").oldfiles,
  { desc = "[?] Find recently opened files" }
)
bind(
  "n",
  "<leader>fb",
  require("telescope.builtin").buffers,
  { desc = "[ ] Find existing buffers" }
)
bind("n", "<leader>fs", function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require("telescope.themes").get_dropdown {
      winblend = 10,
      previewer = false,
    }
  )
end, { desc = "[/] Fuzzily search in current buffer]" })

bind(
  "n",
  "<leader>ff",
  require("telescope.builtin").find_files,
  { desc = "[S]earch [F]iles" }
)
bind(
  "n",
  "<leader>fh",
  require("telescope.builtin").help_tags,
  { desc = "[S]earch [H]elp" }
)
bind(
  "n",
  "<leader>fw",
  require("telescope.builtin").grep_string,
  { desc = "[S]earch current [W]ord" }
)
bind(
  "n",
  "<leader>fg",
  require("telescope.builtin").live_grep,
  { desc = "[S]earch by [G]rep" }
)
bind(
  "n",
  "<leader>fd",
  require("telescope.builtin").diagnostics,
  { desc = "[S]earch [D]iagnostics" }
)

-- hop setup
bind("", "s", "<cmd>HopChar1<cr>")

-- neogen setup
bind(
  "n",
  "<Leader>nf",
  ":lua require('neogen').generate()<CR>",
  { noremap = true, silent = true }
)

-- rainbow-delimiters setup
vim.g.rainbow_delimiters = {
  strategy = {
    [""] = rainbow_delimiters.strategy["global"],
    vim = rainbow_delimiters.strategy["local"],
  },
  query = {
    [""] = "rainbow-delimiters",
    lua = "rainbow-blocks",
    javascript = "rainbow-delimiters-react",
    tsx = "rainbow-parens",
  },
  highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
  },
}

-- lspsaga setup
-- bind("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- bind("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
bind("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
bind("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
bind("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
bind({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
bind("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", opts)

-- treesitter-textobjects setup
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

bind({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
bind({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

bind({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
bind({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
bind({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
bind({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
