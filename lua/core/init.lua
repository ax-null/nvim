vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false

vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.fillchars = { eob = " " }
vim.opt.wrap = false

vim.opt.completeopt = 'menuone,noselect'
vim.opt.termguicolors = true

vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.undofiles = true

vim.env.SHELL = 'powershell'

require('core.mappings').load_mapping('default')
