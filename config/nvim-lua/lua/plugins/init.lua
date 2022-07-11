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
  use 'Mofiqul/dracula.nvim'
	use 'morhetz/gruvbox'
  use {
    'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		}
  }

	-- Language Syntax
	use { 'tpope/vim-rails', ft = 'rb' } -- vim plugin for editing rails
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- syntax highlighting

	-- Test
	use 'benmills/vimux'    -- send input to tmux
	use 'vim-test/vim-test' -- vim test runner

	-- Git
	use 'junegunn/gv.vim'    -- git commit browser
	use { 'lewis6991/gitsigns.nvim', tag = 'release' } -- git wrapper
	use {
		'tanvirtin/vgit.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}
	use 'tpope/vim-fugitive' -- git wrapper
	use 'tpope/vim-rhubarb'  -- enable :GBrowse

	-- Search
	use { -- fuzzy finder
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use { -- file explorer
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
		tag = 'nightly',
	}
	use { -- diagnostic
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}
	use { -- session management
		'rmagatti/auto-session',
	}
	use { -- session fzzy finder
		'rmagatti/session-lens',
		requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
	}

	-- Completion
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	use 'mattn/emmet-vim'             -- expand abbreviations
	use 'mlaursen/vim-react-snippets' -- collection of JS and TS snippets for React

	-- Util
	use 'BurntSushi/ripgrep'       -- text searcher
	use 'Chiel92/vim-autoformat'   -- code formatter
	use 'junegunn/vim-easy-align'  -- align text
	use { 'ojroques/vim-oscyank', branch = 'main' } -- copy text to system clipboard
	use 'nvim-lua/popup.nvim'      -- implementation of Popup API from vim in neovim
	use 'majutsushi/tagbar'        -- tag browser
	use 'mhinz/vim-startify'          -- vim start screen
	use 'skywind3000/asyncrun.vim'    -- run shell cmd in bg
	use 'terryma/vim-expand-region'   -- text selector
	use 'tpope/vim-surround'    -- manipulate surrounding text
	use 'tpope/vim-commentary'  -- comment stuff out
	use 'tpope/vim-endwise'     -- automatic end code structure
	use 'tpope/vim-eunuch'      -- vim UNIX shell cmd sugar
	use 'tpope/vim-unimpaired'  -- handy bracket mappings
	use 'tpope/vim-dispatch'    -- async build and test dispatcher
	use 'windwp/nvim-autopairs' -- autopairs for nvim
	use 'Yggdroot/indentLine'   -- display indentation levels
	use 'zirrostig/vim-schlepp' -- move text selections around

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

