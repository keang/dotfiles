vim.g.snacks_animate = false
return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = "zellij",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        desc = "Sidekick Focus",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      vim.schedule(function()
        vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
        vim.keymap.set("n", "<leader>gC", "<cmd>Gdiffsplit!<cr>", { desc = "Conflict 3-way split" })
        vim.keymap.set("n", "<leader>gd", "<cmd>Gdiff<cr>", { desc = "Gdiff" })
        vim.keymap.set("n", "<leader>gD", "<cmd>Git log --stat -p<cr>", { desc = "Git log --stat -p" })
        vim.keymap.set("n", "<leader>ge", ":Gedit ", { desc = "Gedit" }) -- Gedit can take commit objects
        vim.keymap.set(
          "n",
          "<leader>gl",
          [[<cmd>Git log --format="%h [%ad] [%an] %s"<cr>]],
          { desc = "Git log oneline" }
        )
        vim.keymap.set("n", "<leader>gL", "<cmd>Git log<cr>", { desc = "Git log" })
        vim.keymap.set("n", "<leader>gg", "<cmd>tab G<cr>", { desc = "G" })
        vim.keymap.set("n", "<leader>gP", "<cmd>Git pull", { desc = "Git pull" })
        vim.keymap.set(
          "n",
          "<leader>gp",
          "<cmd>Git -c push.default=current push<cr>",
          { desc = "Git -c push.default=current push" }
        )
        vim.keymap.set("n", "<leader>gr", "<cmd>Gread<cr>", { desc = "Gread" })
        vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Gwrite" })
        vim.keymap.set("n", "<leader>gu", "<cmd>diffupdate<cr>", { desc = "diffupdate" })
        vim.keymap.set("n", "<leader>g2", "<cmd>diffget //2<cr>", { desc = "diffget //2" })
        vim.keymap.set("n", "<leader>g3", "<cmd>diffget //3<cr>", { desc = "diffget //3" })

        vim.api.nvim_create_autocmd("FileType", {
          pattern = "fugitive",
          callback = function()
            -- Your custom mapping here
            vim.keymap.set("n", "cc", ":Git commit<CR>", { buffer = true })
          end,
        })
      end)
    end,
  },
}
