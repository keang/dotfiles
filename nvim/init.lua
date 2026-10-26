-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.lsp.enable("svelte-language-server")
vim.lsp.enable("solargraph")
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")
