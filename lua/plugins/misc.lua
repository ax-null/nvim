return {

	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'tpope/vim-sleuth',

	'lukas-reineke/indent-blankline.nvim',
	'xiyaowong/nvim-transparent',
	
	{ 'folke/neodev.nvim',       opts = {} },
	{ 'lewis6991/gitsigns.nvim', opts = {} },
	{ 'numToStr/Comment.nvim', opts = {}, },

	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		tag = "legacy",
		opts = {},
	},

	{
		'lewis6991/impatient.nvim',
		config = function()
			require('impatient')
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
		config = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
			require('nvim-treesitter.configs').setup {
				ensure_installed = { 'lua' },
				highlight = { enable = true },
				indent = { enable = true, disable = { 'python' } },
			}
		end
	},

	{
		'folke/which-key.nvim',
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
		},
		config = function(_, opts)
			require('which-key').setup(opts)
			require('which-key').register(require('core.mappings').prefixes)
		end,
	},

}

