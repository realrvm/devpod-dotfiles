return {
  'rafamadriz/friendly-snippets',
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({
      include = { 'javascript', 'typescript', 'javascriptreact', 'html',
        'css', 'typescriptreact', 'vue', 'svelte' }
    })
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
  end
}
