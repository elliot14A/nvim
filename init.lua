-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local lsp = require("lspconfig")

lsp.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
        disabled = { "unresolved-proc-macro" },
        enableExperimental = true,
      },
    },
  },
})
