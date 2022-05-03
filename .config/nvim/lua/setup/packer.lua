-- ____            _                              _
-- |  _ \ __ _  ___| | _____ _ __       _ ____   _(_)_ __ ___
-- | |_) / _` |/ __| |/ / _ \ '__|     | '_ \ \ / / | '_ ` _ \
-- |  __/ (_| | (__|   <  __/ |     _  | | | \ V /| | | | | | |
-- |_|   \__,_|\___|_|\_\___|_|    (_) |_| |_|\_/ |_|_| |_| |_|

-- ~/.config/nvim/lua/setup/packer.lua

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' }
		end,
	}
}

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- Required by other plugins
	use 'kyazdani42/nvim-web-devicons'
	use { 'nvim-lua/plenary.nvim' }
	-- Statusline and tabline plugins
	use 'romgrk/barbar.nvim'
	use { 'nvim-lualine/lualine.nvim' }
	-- Telescope and extensions
	use { 'nvim-telescope/telescope.nvim' }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'folke/which-key.nvim' }
	-- LSP plugins
	use {'neovim/nvim-lspconfig'}
	use { 'williamboman/nvim-lsp-installer' }
	-- nvim-cmp
	use {'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-nvim-lua'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use { 'uga-rosa/cmp-dictionary' }
	-- For ultisnips
	use {'SirVer/ultisnips'}
	use {'quangnguyen30192/cmp-nvim-ultisnips'}
	use 'honza/vim-snippets'
	-- For luasnip
	use { 'L3MON4D3/LuaSnip' }
	use { 'saadparwaiz1/cmp_luasnip' }
	use { 'onsails/lspkind-nvim' }
	use { 'f3fora/cmp-spell' }
	-- File Managers
	use { 'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x' }
	use { 'MunifTanjim/nui.nvim' }
	use { 'kyazdani42/nvim-tree.lua' }
	-- Colorschemes
	use { 'p00f/nvim-ts-rainbow' }
	use { 'norcalli/nvim-colorizer.lua' }
	use { 'lifepillar/vim-gruvbox8' }
	use { 'Mofiqul/dracula.nvim' }
	use { 'rebelot/kanagawa.nvim' }
	-- Other plugins
	use { 'windwp/nvim-autopairs' }
	use { 'lukas-reineke/indent-blankline.nvim' }
	use {"akinsho/toggleterm.nvim"}
	use { 'lewis6991/gitsigns.nvim' }
	use { 'rcarriga/nvim-notify' }
	use { 'tpope/vim-surround' }
	use { 'tpope/vim-fugitive' }
	use { 'godlygeek/tabular' }
end)
