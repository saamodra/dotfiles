local Plugins = {
  {'tpope/vim-fugitive'},
  {'wellle/targets.vim'},
  {'tpope/vim-repeat'},
  {'kyazdani42/nvim-web-devicons', lazy = true},
  {'numToStr/Comment.nvim', config = true, event = 'VeryLazy'},
  {'mg979/vim-visual-multi'},
	{'slim-template/vim-slim'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/nvim-compe'},
	{'tpope/vim-dispatch'},
	{'onsails/lspkind.nvim'},
  {'vim-test/vim-test'},
  { 'echasnovski/mini.nvim', version = false },

  -- Themes
  {'folke/tokyonight.nvim'},
  {'joshdick/onedark.vim'},
  {'tanvirtin/monokai.nvim'},
  {'lunarvim/darkplus.nvim'},
	{'catppuccin/nvim', name = 'catppuccin', priority = 1000}
}

return Plugins
