-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = require("utils.map").map

vim.keymap.set("n", "<C-P>", "<leader>ff", { remap = true, desc = "Alias for <C-P>" })
vim.api.nvim_set_keymap("t", "q", "<C-\\><C-n>", { noremap = true, silent = true })

map("n", "<leader>cw", "<cmd>lua StripTrailingWhitespaces()<cr>", "Strip trailing whitespaces")
map("n", "<leader>cr", "<cmd>lua CopyRelativeFilePath()<cr>", "Copy relative file path")

map("n", "<leader>tr", ':lua require("neotest").run.run()<CR>', "Run Test")
map("n", "<leader>tc", ':lua require("neotest").run.stop()<CR>', "Stop Test")
map("n", "<leader>tt", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "Run Tests on Current File")
map("n", "<leader>ta", ':lua require("neotest").run.attach()<CR>', "Attach to Test")
map("n", "<leader>ts", ':lua require("neotest").summary.toggle()<CR>', "Toggle Test Summary")
map("n", "<leader>to", ':lua require("neotest").output_panel.toggle()<CR>', "Toggle Test Output")
