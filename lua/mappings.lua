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
			['<leader>ff'] = { function() require('telescope.builtin').find_files() end, '[F]iles' },

			['<leader>fb'] = { '<cmd>:Telescope file_browser<cr>', '[B]rowser' },
		}
	},

	terminal = {
		n = {
			['<leader>tf'] = { '<cmd>:ToggleTerm direction=float<cr>', '[F]loating Terminal' },
			['<leader>tv'] = { '<cmd>:ToggleTerm direction=vertical<cr>', '[V]ertical Terminal' },
			['<leader>th'] = { '<cmd>:ToggleTerm direction=horizontal<cr>', '[H]orizontal Terminal' },
		},

		t = {
			['<esc>'] = { [[<C-\><C-n>]], 'escape from terminal' },
			['<C-h>'] = { [[<Cmd>wincmd h<CR>]], 'jump to left window' },
			['<C-j>'] = { [[<Cmd>wincmd j<CR>]], 'jump to down window' },
			['<C-k>'] = { [[<Cmd>wincmd k<CR>]], 'jump to up window' },
			['<C-l>'] = { [[<Cmd>wincmd l<CR>]], 'jump to right window' },
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
