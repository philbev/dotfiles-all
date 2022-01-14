-- ***********************************************
-- *          PACKER CONFIGURATION FILE          *
-- ***********************************************

-- See https://github.com/wbthomason/packer.nvim for more details.
-- This file can be loaded by calling `lua require('default.packer-conf')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost init.lua source <afile> | PackerSync
--   augroup end
-- ]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'lifepillar/vim-gruvbox8'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}  -- We recommend updating the parsers on update use 'machakann/vim-highlightedyank'
    use 'hrsh7th/cmp-nvim-lua'
    use 'onsails/lspkind-nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'romgrk/barbar.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'folke/which-key.nvim'
    use 'windwp/nvim-autopairs'
    use 'p00f/nvim-ts-rainbow'
    -- use 'kdheepak/tabline.nvim'
    -- use 'hoob3rt/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'dhruvmanila/telescope-bookmarks.nvim'
    use 'machakann/vim-highlightedyank'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'lewis6991/gitsigns.nvim'
    use 'akinsho/toggleterm.nvim'
end)