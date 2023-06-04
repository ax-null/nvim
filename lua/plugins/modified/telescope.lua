return {
	'nvim-telescope/telescope.nvim',

	dependencies = {
		'nvim-telescope/telescope-file-browser.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'mingw32-make' }
	},

	opts = {
		defaults = {
			layout_config = {
				horizontal = {
					prompt_position = "bottom",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			layout_strategy = "horizontal",
			sorting_strategy = "ascending",
			winblend = 0,
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				'--ignore-file',
				'.gitignore'
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case"
			},
			
			file_browser = {
				grouped = true,
			}
		},
	},

	config = function(_, opts)
		require('telescope').setup(opts)
		require('telescope').load_extension('fzf')
		require('telescope').load_extension('file_browser')

		require('mappings').load_mapping('telescope')
	end
}
