local Plugins = {
  { 'tpope/vim-fugitive' },
  { 'wellle/targets.vim' },
  { 'tpope/vim-repeat' },
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  { 'numToStr/Comment.nvim', config = true, event = 'VeryLazy' },
  { 'mg979/vim-visual-multi' },
	{ 'slim-template/vim-slim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/nvim-compe' },
	{ 'tpope/vim-dispatch' },
	{ 'onsails/lspkind.nvim' },
  { 'vim-test/vim-test' },
  { 'echasnovski/mini.move', version = false },
  { 'echasnovski/mini.pairs', version = false },
  { 'echasnovski/mini.surround', version = false },
  { 'echasnovski/mini.bracketed', version = false },
  { 'echasnovski/mini.trailspace', version = false },
  { 'chrisgrieser/nvim-spider', lazy = true },

  -- Themes
  { 'folke/tokyonight.nvim' },
  { 'joshdick/onedark.vim' },
  { 'tanvirtin/monokai.nvim' },
  { 'lunarvim/darkplus.nvim' },
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }
}

return Plugins
