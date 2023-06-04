return {
	'akinsho/toggleterm.nvim',

	opts = {
		float_opts = {
			border = 'curved',
		},
	},

	config = function(_, opts)
		require('toggleterm').setup(opts)
		require('mappings').load_mapping('terminal')
	end,
}
