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
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"

	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'

	-- Language Syntax
	use 'sheerun/vim-polyglot'
	use 'Chiel92/vim-autoformat'
	use 'ianks/vim-tsx'
	use 'jparise/vim-graphql'
	use { 'leafgarland/typescript-vim', ft = 'ts' }
	use { 'styled-components/vim-styled-components', branch = 'main' }
	use { 'vim-ruby/vim-ruby', ft = 'rb' }
	use { 'tpope/vim-rails', ft = 'rb' }

	-- Util
	use { 'ojroques/vim-oscyank', branch = 'main' }
	use 'jiangmiao/auto-pairs'
	use 'zirrostig/vim-schlepp'
	use 'mattn/emmet-vim'
	use 'BurntSushi/ripgrep'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { "williamboman/nvim-lsp-installer" }
	use { "neovim/nvim-lspconfig" }

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release',
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		tag = 'nightly',
	}

	use { 'scrooloose/nerdtree', cmd = { 'NERDTreeToggle', 'NERDTreeFind' } }
	use 'terryma/vim-expand-region'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-endwise'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-unimpaired'
	use 'tpope/vim-dispatch'
	use 'eshion/vim-sync'
	use 'skywind3000/asyncrun.vim'
	use 'mlaursen/vim-react-snippets'
	use 'vim-test/vim-test'
	use { 'rcarriga/vim-ultest', run = ':UpdateRemotePlugins' }
	use 'benmills/vimux'

	-- Search
	use { 'junegunn/fzf', run = { 'cd ~/.fzf', './install --no-bash' } }
	use 'junegunn/fzf.vim'

	-- Syntax Theme Colors
	use 'morhetz/gruvbox'
	use 'vim-airline/vim-airline'
	use 'edkolev/tmuxline.vim'

	-- automatically set up config after cloning packer.nvim
	-- put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

	-- Plugins settings
	require('plugins/treesitter')
	require('plugins/lsp')
	require('plugins/completion')
	require('plugins/nvim_tree')
	require('plugins/mappings')
end)

