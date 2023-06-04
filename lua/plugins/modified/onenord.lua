local M = {
	'rmehri01/onenord.nvim',

	config = function()
		local colors = require("onenord.colors").load()

		require('onenord').setup({
			theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
			borders = true, -- Split window borders
			fade_nc = false, -- Fade non-current windows, making them more distinguishable

			-- Style that is applied to various groups: see `highlight-args` for options
			styles = {
				comments = "italic",
				strings = "NONE",
				keywords = "NONE",
				functions = "NONE",
				variables = "NONE",
				diagnostics = "underline",
			},

			disable = {
				background = false, -- Disable setting the background color
				cursorline = false, -- Disable the cursorline
				eob_lines = true, -- Hide the end-of-buffer lines
			},

			-- Inverse highlight for different groups
			inverse = {
				match_paren = false,
			},

			-- Overwrite default highlight groups
			custom_highlights = {
				['NormalFloat'] = { bg = colors.highlight },

				['FloatTitle'] = { bg = colors.purple, fg = colors.highlight },
				['FloatBorder'] = { bg = colors.highlight, fg = colors.highlight },

				['TelescopeNormal'] = { fg = colors.bg },
				['TelescopeMatching'] = { fg = colors.purple },
				['TelescopeSelection'] = { fg = colors.fg, bg = colors.highlight, bold = true },

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
			},

			custom_colors = {}, -- Overwrite default colors

		})
	end,
}

return M
