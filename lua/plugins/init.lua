require("lazy").setup({

	'neovim/nvim-lspconfig',

	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'tpope/vim-sleuth',

	'nvim-lua/plenary.nvim',
	'nvim-tree/nvim-web-devicons',

	'lukas-reineke/indent-blankline.nvim',

	'xiyaowong/nvim-transparent',

	{ 'akinsho/flutter-tools.nvim', opts = {} },
	{ 'folke/neodev.nvim',          opts = {} },
	{ 'j-hui/fidget.nvim',          opts = {} },
	{ 'lewis6991/gitsigns.nvim',    opts = {} },
	{ 'numToStr/Comment.nvim',      opts = {} },
	{ 'williamboman/mason.nvim',    opts = {} },

	require('plugins.modified.impatient'),
	require('plugins.modified.mason-lspconfig'),
	require('plugins.modified.telescope'),
	require('plugins.modified.nvim-cmp'),
	require('plugins.modified.nvim-treesitter'),
	require('plugins.modified.which-key'),
	require('plugins.modified.toggleterm'),
	require('plugins.modified.dressing'),
	require('plugins.modified.onenord'),
	require('plugins.modified.lualine')

}, {})
