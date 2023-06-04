return {
	'folke/which-key.nvim',
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
	},
	config = function(_, opts)
		require('which-key').setup(opts)
		require('which-key').register(require('mappings').prefixes)
	end,
}
