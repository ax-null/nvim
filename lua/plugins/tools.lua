return {

	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim',
		},
		config = true,
	},
	
	{
		'numToStr/FTerm.nvim',
		opts = {
			ft = 'Terminal',
			border = 'double',
			auto_close = true,
			hl = 'NormalFloat',
		},
		config = function(_, opts)
			require('FTerm').setup(opts)
			require('core.mappings').load_mapping('terminal')
		end,
	},

	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
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
			require('telescope').load_extension('file_browser')

			require('core.mappings').load_mapping('telescope')
		end
	},
	
}

