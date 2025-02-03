return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>t", group = "tests" },
      },
    },
  },
}
