local function handlers(capabilities)
	return {
		function(server_name)
			require('lspconfig')[server_name].setup { capabilities = capabilities, settings = {} }
		end,

		['lua_ls'] = function()
			require('lspconfig').lua_ls.setup {
				capabilities = capabilities,
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			}
		end,

		['jdtls'] = function()
			require('lspconfig').jdtls.setup {
				capabilities = capabilities,
				cmd = {
					'java',
					'-Declipse.application=org.eclipse.jdt.ls.core.id1',
					'-Dosgi.bundels.defaultStartLevel=4',
					'-Declipse.product=org.eclipse.jdt.ls.core.product',
					'-Dlog.protocol=true',
					'-Dlog.level=ALL',
					'-Xms1g',
					'--add-modules=ALL-SYSTEM',
					'--add-opens', 'java.base/java.util=ALL-UNNAMED',
					'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

					'-jar',
					vim.fn.stdpath('data') ..
					'/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
					'-configuration', vim.fn.stdpath('data') .. '/mason/packages/jdtls/config_win',
					'-data',
					vim.fn.stdpath('data') ..
					'/user/java/workspace-root/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
				},
				settings = {
					sources = {
						eclipse = { downloadSources = true },
						maven = { downloadSources = true },
						implementationCodeLens = { enabled = true },
						referencesCodeLens = { enabled = true },
						references = { includeDecompiledSources = true },
						organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
					},
				},
				init_options = {
					extendedClientCapabilities = {
						progressReportProvider = true,
					},
				},
			}
		end,
	}
end

local M = {
	'williamboman/mason-lspconfig',

	dependencies = { 'hrsh7th/nvim-cmp' },

	opts = {
		ensure_installed = { 'lua_ls' },
	},

	config = function(_, opts)
		require('mason-lspconfig').setup(opts)
		require('mason-lspconfig').setup_handlers(
			handlers(require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()))
		)

		require('mappings').load_mapping('lsp')
	end,
}

return M
