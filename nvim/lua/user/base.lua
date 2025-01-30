vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 2
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.foldcolumn = '1'
vim.opt.showmatch = true
vim.opt.mouse = 'a'
vim.opt.updatetime = 50
vim.opt.wrap = true -- long lines wrap and continue on the next line
vim.opt.linebreak = true -- wrap long lines at a blank
vim.opt.list = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.splitbelow = true -- new window from split is below the current one
vim.opt.splitright = true -- new window is put right of the current one
vim.opt.textwidth = 120 --
vim.opt.swapfile = false
vim.opt.history = 64 -- number of command-lines that are remembered
vim.opt.undolevels = 128 -- maximum number of changes that can be undone
vim.opt.undodir = '/home/rvm/.config/nvim/undodir' -- where to store undo files
vim.opt.undofile = true -- save undo information in a file
vim.opt.undoreload = 264 -- max nr of lines to save for undo on a buffer reload
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.matchpairs:append { '<:>' }
vim.opt.formatoptions:append { 't' }
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = "dark" -- 'dark' or 'light'

-- netrw setup
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 3
