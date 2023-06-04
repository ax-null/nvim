-- Configs
local opt = vim.opt
local g = vim.g
local o = vim.o

opt.number = true
opt.relativenumber = true
opt.ruler = false

opt.signcolumn = 'yes'
opt.clipboard = 'unnamedplus'

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.fillchars = { eob = " " }
opt.wrap = false

opt.completeopt = 'menuone,noselect'
opt.termguicolors = true

opt.updatetime = 250

opt.timeout = true
opt.timeoutlen = 300

g.mapleader = ' '
g.maplocalleader = ' '

o.undofiles = true

-- User Commands
vim.api.nvim_create_user_command('Config', 'edit ' .. vim.fn.stdpath('config') .. '/init.lua', { nargs = 0 })
