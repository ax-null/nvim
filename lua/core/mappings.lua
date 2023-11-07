local M = {}

M.prefixes = {
	mode = { "n", "v" },

	['['] = { name = '+Previous' },
	[']'] = { name = '+Next' },

	['<leader>'] = { name = '+Action' },
	['<leader>c'] = { name = '+Code' },
	['<leader>f'] = { name = '+File/Find' },
	['<leader>g'] = { name = '+Goto' },
	['<leader>s'] = { name = '+Search' },
	['<leader>t'] = { name = '+Toggle' },
	['<leader>w'] = { name = '+Workspace' },
}

M.defined = {
	default = {
		n = {
			['<F5>'] = { '<Cmd>wa<bar>lua require(\'FTerm\').toggle()<CR><Up><CR>', 'Execute last terminal command' },

			['<C-s>'] = { '<Cmd>wa<CR>', 'Save all buffers' },

			['<A-,>'] = { '<Cmd>BufferPrevious<CR>', 'Goto previous buffer' },
			['<A-.>'] = { '<Cmd>BufferNext<CR>', 'Goto next buffer' },

			['<A-<>'] = { '<Cmd>BufferMovePrevious<CR>', 'Move buffer backward' },
			['<A->>'] = { '<Cmd>BufferMoveNext<CR>', 'Move buffer forwared' },

			['<A-p>'] = { '<Cmd>BufferPin<CR>', 'Pin current buffer' },

			['<A-c>'] = { '<Cmd>BufferClose<CR>', 'Close buffer' },
			['<A-r>'] = { '<Cmd>BufferRestore<CR>', 'Restore buffer' },
		}
	},

	lsp = {
		n = {
			["[d"] = { function() vim.diagnostic.goto_prev({}) end, "Previous [D]iagnostic" },
			["]d"] = { function() vim.diagnostic.goto_next() end, "Next [D]iagnostic" },

			["<leader>gD"] = { function() vim.lsp.buf.declaration() end, "[D^]eclaration" },
			["<leader>gd"] = { function() vim.lsp.buf.definition() end, "[D]efinition" },
			["<leader>gr"] = { function() vim.lsp.buf.references({}) end, "[R]eferences" },
			["<leader>gi"] = { function() vim.lsp.buf.implementation() end, "[I]mplementation" },

			["<leader>h"] = { function() vim.lsp.buf.hover() end, "[H]over", },
			["<leader>D"] = { function() vim.lsp.buf.type_definition() end, "[D]efinition" },
			["<leader>d"] = { function() vim.diagnostic.setloclist() end, "[D]iagnostics List" },

			["<leader>ch"] = { function() vim.lsp.buf.signature_help() end, "[H]elp" },
			["<leader>cr"] = { function() vim.lsp.buf.rename() end, "[R]ename" },
			["<leader>ca"] = { function() vim.lsp.buf.code_action() end, "[A]ctions" },
			["<leader>cf"] = { function() vim.lsp.buf.format { async = true } end, "[F]ormat" },
			["<leader>cd"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating [D]iagnostic" },

			["<leader>wa"] = { function() vim.lsp.buf.add_workspace_folder() end, "[A]dd workspace folder" },
			["<leader>wr"] = { function() vim.lsp.buf.remove_workspace_folder() end, "[R]emove workspace folder" },

			["<leader>wl"] = { function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[L]ist workspace folders" },
		}
	},

	telescope = {
		n = {
			['<leader>?'] = { function() require('telescope.builtin').oldfiles() end, '[?] Find recently opened files' },
			['<leader><space>'] = { function() require('telescope.builtin').buffers() end, '[ ] Find existing buffers' },

			['<leader>/'] = { function()
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false
				})
			end, '[/] Fuzzily search in current buffer' },

			['<leader>sh'] = { function() require('telescope.builtin').help_tags() end, '[H]elp' },
			['<leader>sd'] = { function() require('telescope.builtin').diagnostics() end, '[D]iagnostics' },
			['<leader>sg'] = { function() require('telescope.builtin').live_grep() end, '[G]rep' },

			['<leader>fw'] = { function() require('telescope.builtin').grep_string() end, '[W]ord' },
			['<leader>ff'] = { function() require('telescope.builtin').find_files({ hidden = true }) end, '[F]iles' },

			['<leader>fb'] = { '<cmd>:Telescope file_browser hidden=true initial_mode=normal path=%:p:h select_buffer=true<cr>',
				'[B]rowser' },
		}
	},

	terminal = {
		n = {
			['<leader>tt'] = { function() require('FTerm').toggle() end, '[T]erminal' },
		},

		t = {
			['<ESC>'] = { [[<C-\><C-n><C-w>q]], 'escape from terminal' },
		},
	},
}

M.load_mapping = function(name)
	for mode, values in pairs(M.defined[name]) do
		for key, action in pairs(values) do
			vim.keymap.set(mode, key, action[1], { desc = action[2] })
		end
	end
end

return M
