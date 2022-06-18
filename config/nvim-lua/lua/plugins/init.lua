local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return packer.startup(function(use)
	-- Packer
	use "wbthomason/packer.nvim"

	-- Theme
	use 'morhetz/gruvbox'
  use {
    'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		}
  }
	use 'mhinz/vim-startify'
  use { 'Mofiqul/dracula.nvim' }

	-- Language Syntax
	use { 'tpope/vim-rails', ft = 'rb' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Test
	use 'benmills/vimux'
	use 'vim-test/vim-test'

	-- Git
	use 'airblade/vim-gitgutter'
	use 'junegunn/gv.vim'
	use { 'lewis6991/gitsigns.nvim', tag = 'release' }
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'

	-- Search
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
		tag = 'nightly',
	}

	-- Completion
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- IDE/Util
	use 'BurntSushi/ripgrep'
	use 'Chiel92/vim-autoformat'
	use 'eshion/vim-sync'
	use 'junegunn/vim-easy-align'
	use { 'ojroques/vim-oscyank', branch = 'main' }
	use 'nvim-lua/popup.nvim'
	use 'majutsushi/tagbar'
	use 'mattn/emmet-vim'
	use 'mlaursen/vim-react-snippets'
	use 'skywind3000/asyncrun.vim'
	use 'terryma/vim-expand-region'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-endwise'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-unimpaired'
	use 'tpope/vim-dispatch'
	use 'windwp/nvim-autopairs'
	use 'Yggdroot/indentLine'
	use 'zirrostig/vim-schlepp'

	-- automatically set up config after cloning packer.nvim
	-- put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

	-- Plugins settings
	local require_dir = require('utils').require_dir

	-- load all additional configs dynamically
	-- to save from adding in manually
	local config_dirs = { 'plugins' }
	for _, dir in pairs(config_dirs) do
		require_dir(dir)
	end
end)

