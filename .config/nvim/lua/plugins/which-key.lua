return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps",
    },
  },
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>f", group = "Telescope" },
      { "<leader>fo", desc = "Recently Opened Files" },
      { "<leader>fb", desc = "Open Buffers" },
      { "<leader>ff", desc = "Find Files" },
      { "<leader>fg", desc = "Live Grep" },
      { "<leader>fd", desc = "Diagnostics" },
      { "<leader>fs", desc = "Search in Buffer" },

      { "<leader>g", group = "Git" },
      { "<leader>gs", desc = "Git Status" },
      { "<leader>gh", desc = "Git Changes" },
      { "<leader>gd", desc = "Git Diff" },
      { "<leader>gb", desc = "Git Blame" },
      { "<leader>gr", desc = "Git Read (Checkout File)" },
      { "<leader>gw", desc = "Git Write (Stage File)" },
      { "<leader>ge", desc = "Git Edit (Open File in Index)" },
      { "<leader>gc", desc = "Github Copilot Chat" },

      { "<leader>t", group = "Test" },
      { "<leader>tf", desc = "Run Test Vim-Test" },
      { "<leader>tr", desc = "Run Test" },
      { "<leader>tt", desc = "Run Test on Current File" },
      { "<leader>ts", desc = "Toggle Test Summary" },
      { "<leader>ta", desc = "Attach to Test" },

      { "<leader>c", group = "Custom Commands", icon = "" },
      { "<leader>cr", icon = "󰆏" },
      { "<leader>b", group = "Buffer", icon = "󰀼" },
      { "<leader>a", icon = "" },
      { "<leader>e", icon = "", desc = "File Explorer" },
      { "<leader>E", icon = "", desc = "Focus File" },

      { "<leader>?", icon = "󰋗" },
    })
  end,
}
