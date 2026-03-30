-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>pa", ":let @+ = expand('%:p')<CR>", { desc = "Copy absolute path" })
vim.keymap.set("n", "<leader>pr", ":let @+ = expand('%')<CR>", { desc = "Copy relative path" })
vim.keymap.set("n", "<leader>fs", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>fx", ":wq<CR>", { desc = "Save file and q" })
vim.keymap.set("n", "C-p", function()
  Snacks.picker.smart()
end, { desc = "Find files" })
