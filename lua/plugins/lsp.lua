return {

	{
		'williamboman/mason.nvim',
		opts = {
			ensure_installed = { 'lua_ls' },
		},
	},

	{
		'williamboman/mason-lspconfig',
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/nvim-cmp',
		},
		config = function(_)
			local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities());
			require('mason-lspconfig').setup()
			require('mason-lspconfig').setup_handlers({
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
							vim.fn.stdpath('data') .. '/mason/bin/jdtls'
						},
						settings = {
							sources = {
								eclipse = { downloadSources = true },
								maven = { downloadSources = true },
								implementationCodeLens = { enabled = true },
								referencesCodeLens = { enabled = true },
								references = { includeDecompiledSources = true },
								organizeImports = { starThreshold = 9999, staticStarThreshold = 1 },
							},
						},
						init_options = {
							extendedClientCapabilities = {
								progressReportProvider = true,
							},
						},
					}
				end,
			})
			require('core.mappings').load_mapping('lsp')
		end,
	},

	{
		'hrsh7th/nvim-cmp',
		event = "VeryLazy",
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					},
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
								"")
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" }, }),
			})
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{
						name = 'cmdline',
						option = {
							ignore_cmds = { 'Man', '!' }
						}
					}
				})
			})
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})
		end,
	},

}
