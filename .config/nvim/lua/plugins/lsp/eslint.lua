local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.eslint.setup({
  capabilities = lsp_capabilities,
  cmd = { '/home/samodra/.local/share/nvim/mason/bin/vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' },
})
