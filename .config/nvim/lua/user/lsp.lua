-- ************************************************************
-- *          LANGUAGE SERVER PROTOCOL CONFIGURATION          *
-- ************************************************************

-- See https://github.com/neovim/nvim-lspconfig for more details.
-- Also https://github.com/williamboman/nvim-lsp-installer

-- Python server
require'lspconfig'.pyright.setup{}

-- Bash server
require'lspconfig'.bashls.setup{}
