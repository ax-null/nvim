return {

	{
		'romgrk/barbar.nvim',
		event = 'VeryLazy',
		dependencies = {
			'lewis6991/gitsigns.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		opts = {
			highlight_visible = false,
			icons = {
				preset = 'slanted',
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
				},
				separator_at_end = false,
				modified = { button = '●' },
				inactive = {
					separator_at_end = false,
				},
			},
			maximum_padding = 1,
			minimum_padding = 1,
			no_name_title = 'Empty',
		},
	},

	{
		"utilyre/barbecue.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = {
				normal = { fg = 'none', bg = 'none' },
			},
		},
	},

	{
		'stevearc/dressing.nvim',
		event = 'VeryLazy',
		opts = {
			input = {
				enabled = true,
				default_prompt = "Input:",
				title_pos = "center",
				insert_only = true,
				start_in_insert = true,
				border = "rounded",
				relative = "cursor",
				prefer_width = 40,
				width = nil,
				max_width = { 140, 0.9 },
				min_width = { 20, 0.2 },
				buf_options = {},
				win_options = {
					winblend = 0,
					wrap = false,
					list = true,
					listchars = "precedes:…,extends:…",
					sidescrolloff = 0,
				},
			},
		}
	},

	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = 'auto',
				component_separators = '',
				section_separators = { left = '', right = '' },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ 'mode', separator = { left = '' } },
				},
				lualine_b = { 'branch', 'filename', 'fileformat' },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { 'diff', 'diagnostics', 'filetype', 'progress' },
				lualine_z = {
					{ 'location', separator = { right = '' } },
				},
			},
		},
		config = function(_, opts)
			opts.options.theme = require('lualine.themes.onenord')
			opts.options.theme.normal.c = { bg = 'None' }
			require('lualine').setup(opts)
		end,
	},

	{
		'rmehri01/onenord.nvim',
		config = function()
			local colors = require('onenord.colors').load()
			require('onenord').setup({
				theme = nil,
				borders = true,
				fade_nc = false,
				styles = {
					comments = "italic",
					strings = "NONE",
					keywords = "NONE",
					functions = "NONE",
					variables = "NONE",
					diagnostics = "underline",
				},
				disable = {
					background = false,
					cursorline = false,
					eob_lines = true,
				},
				inverse = {
					match_paren = false,
				},
				custom_highlights = {
					['NormalFloat'] = { bg = colors.highlight },

					['FloatTitle'] = { bg = colors.purple, fg = colors.highlight },
					['FloatBorder'] = { bg = colors.highlight, fg = colors.highlight },

					['TelescopeNormal'] = { fg = colors.bg },
					['TelescopeMatching'] = { fg = colors.purple },
					['TelescopeSelection'] = { bg = colors.highlight, fg = colors.fg, bold = true },

					['TelescopePromptPrefix'] = { bg = colors.highlight },
					['TelescopePromptNormal'] = { bg = colors.highlight },
					['TelescopeResultsNormal'] = { bg = colors.float },
					['TelescopePreviewNormal'] = { bg = colors.float },
					['TelescopePromptBorder'] = { bg = colors.highlight, fg = colors.highlight },
					['TelescopeResultsBorder'] = { bg = colors.float, fg = colors.float },
					['TelescopePreviewBorder'] = { bg = colors.float, fg = colors.float },
					['TelescopePromptTitle'] = { bg = colors.purple, fg = colors.float },
					['TelescopeResultsTitle'] = { fg = colors.float },
					['TelescopePreviewTitle'] = { bg = colors.blue, fg = colors.float },

					['BufferCurrent'] = { bg = 'None', fg = colors.cyan },
					['BufferCurrentSign'] = { bg = 'None', fg = colors.active },
					['BufferCurrentMod'] = { bg = 'None', fg = colors.yellow, style = "bold" },
					['BufferCurrentERROR'] = { bg = 'None', fg = colors.red },

					['BufferInactive'] = { bg = 'None', fg = colors.light_gray },
					['BufferInactiveSign'] = { bg = 'None', fg = colors.active },

					['TabLineFill'] = { bg = colors.active },

				},
				custom_colors = {},
			})
		end,
	},



}
