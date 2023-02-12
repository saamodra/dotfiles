local M = {}

M.nvimtree = {
  n = {
      ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
      ["<C-n>"] = { "<cmd> Telescope <CR>", "open telescope" },
  },
}

return M

