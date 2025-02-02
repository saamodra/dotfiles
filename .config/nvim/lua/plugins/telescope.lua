local Plugin = {'nvim-telescope/telescope.nvim'}
local map = require('utils.map').map

Plugin.branch = '0.1.x'

Plugin.dependencies = {
  {'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    version = '^1.0.0',
  },
	{'nvim-telescope/telescope-ui-select.nvim'},
  {'jonarrien/telescope-cmdline.nvim'},
}

Plugin.cmd = {'Telescope'}

function Plugin.init()
  map("n", "<C-P>", "<cmd>Telescope find_files<cr>", "Find Files (Ctrl+P)")
  map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", "Recently Opened Files")
  map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "Open Buffers")
  map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "Find Files")
  map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Live Grep")
  map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", "Diagnostics")
  map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in Buffer")
  map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", "Diagnostics")
  map("n", "<leader>fn", "<cmd>Telescope notify<cr>", "Notifications")
  map("n", "<leader>fc", "<cmd>Telescope cmdline<cr>", "Cmdline")
end

function Plugin.config()
  local telescope = require('telescope')
  local lga_actions = require("telescope-live-grep-args.actions")

  telescope.setup({
    extensions = {
      live_grep_args = {
        auto_quoting = true, -- enable/disable auto-quoting
        mappings = { -- extend mappings
          i = {
						["<C-k>"] = lga_actions.quote_prompt(),
						["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						["<C-space>"] = require('telescope.actions').to_fuzzy_refine,
					},
				},
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown { }
			}
		}
	})

  telescope.load_extension('fzf')
  telescope.load_extension('live_grep_args')
  telescope.load_extension('ui-select')
  telescope.load_extension('cmdline')
end

return Plugin
