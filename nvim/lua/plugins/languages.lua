return {
  -- nvim-lspconfig is a dependency for typescript-tools.nvim
  { "neovim/nvim-lspconfig" },

  -- The main plugin for TypeScript integration
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("typescript-tools").setup({
        -- Add any desired configuration options here.
        -- For example, enabling JSX closing tags:
        -- settings = {
        --   jsx_close_tag = {
        --     enable = true,
        --     filetypes = { "javascriptreact", "typescriptreact" },
        --   },
        -- },
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
