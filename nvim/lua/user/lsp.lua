-- variables
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- стандартные горячие клавиши для работы с диагностикой
map("n", "<leader>e", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- стандартные горячие клавиши для LSP
  map("n", "gd", vim.lsp.buf.definition, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "gi", vim.lsp.buf.implementation, bufopts)
  -- map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  map("n", "gr", vim.lsp.buf.references, bufopts)
end

-- инициализация LSP для различных ЯП
require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}
require("mason-lspconfig").setup()
local lspconfig = require "lspconfig"

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers =
  { "lua_ls", "html", "cssls", "ts_ls", "emmet_ls", "prismals" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- иницализация LSP для lua
lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if
      not vim.loop.fs_stat(path .. "/.luarc.json")
      and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
    then
      client.config.settings =
        vim.tbl_deep_extend("force", client.config.settings, {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        })

      client.notify(
        "workspace/didChangeConfiguration",
        { settings = client.config.settings }
      )
    end
    return true
  end,
}

-- иницализация LSP для ts_ls
lspconfig.ts_ls.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
  init_options = {
    configurationSection = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    embeddedLanguages = {
      javascript = true,
      typescript = true,
    },
    provideFormatter = true,
    preferences = {
      disableSuggestions = true,
    },
  },
  settings = {},
  single_file_support = true,
}

-- иницализация LSP для html
lspconfig.html.setup {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      javascript = true,
    },
    provideFormatter = true,
  },
  settings = {},
  single_file_support = true,
}

-- angular
lspconfig["angularls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "ts,html,css,scss" },
}

-- prisma
-- configure prisma server
lspconfig["prismals"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "prisma" },
}

-- иницализация LSP для css&scss
lspconfig.cssls.setup {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss" },
  init_options = {
    configurationSection = { "scss", "css" },
    embeddedLanguages = {
      css = true,
      scss = true,
    },
    provideFormatter = true,
  },
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
  single_file_support = true,
}

-- иницализация LSP для emmet
lspconfig.emmet_ls.setup {
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
}

--иницализация LSP для eslint
lspconfig.eslint.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  cmd = { "vscode-eslint-language-server", "--stdio" },
}

-- luasnip setup
local luasnip = require "luasnip"

-- cmp setup
local cmp = require "cmp"
local lspkind = require "lspkind"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-Space>"] = cmp.mapping.complete { reason = cmp.ContextReason.Auto },
    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
    ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "codeium" },
    { name = "luasnip" },
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      symbol_map = { Codeium = "" },
    },
  },
}

-- autopairs setup
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- diagnostics setup
vim.diagnostic.config {
  signs = false,
  virtual_text = {
    prefix = "●",
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
}
