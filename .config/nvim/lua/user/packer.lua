-- ____            _                              _
-- |  _ \ __ _  ___| | _____ _ __       _ ____   _(_)_ __ ___
-- | |_) / _` |/ __| |/ / _ \ '__|     | '_ \ \ / / | '_ ` _ \
-- |  __/ (_| | (__|   <  __/ |     _  | | | \ V /| | | | | | |
-- |_|   \__,_|\___|_|\_\___|_|    (_) |_| |_|\_/ |_|_| |_| |_|


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
	use 'honza/vim-snippets'
	use 'kyazdani42/nvim-web-devicons'
	use 'romgrk/barbar.nvim'
	use { 'nvim-lualine/lualine.nvim' }
	use { 'nvim-telescope/telescope.nvim' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'folke/which-key.nvim' }
	use {'neovim/nvim-lspconfig'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-nvim-lua'}
	use {'SirVer/ultisnips'}
	use {'quangnguyen30192/cmp-nvim-ultisnips'}
	use { 'onsails/lspkind-nvim' }
	use { 'windwp/nvim-autopairs' }
	use { 'p00f/nvim-ts-rainbow' }
	use { 'lukas-reineke/indent-blankline.nvim' }
	use {"akinsho/toggleterm.nvim"}
	use { 'kyazdani42/nvim-tree.lua' }
	use { 'f3fora/cmp-spell' }
	use { 'lifepillar/vim-gruvbox8' }
	use { 'norcalli/nvim-colorizer.lua' }
	use { 'williamboman/nvim-lsp-installer' }
	use { 'lewis6991/gitsigns.nvim' }
end)
