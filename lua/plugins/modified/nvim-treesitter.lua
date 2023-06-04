local M = {
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
}

return M
