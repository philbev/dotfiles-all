--  _                                __ _         _
-- | |    ___ _ __   ___ ___  _ __  / _(_) __ _  | |_   _  __ _
-- | |   / __| '_ \ / __/ _ \| '_ \| |_| |/ _` | | | | | |/ _` |
-- | |___\__ \ |_) | (_| (_) | | | |  _| | (_| |_| | |_| | (_| |
-- |_____|___/ .__/ \___\___/|_| |_|_| |_|\__, (_)_|\__,_|\__,_|
--           |_|                          |___/

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['sumneko_lua'].setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim', 'use' }
			}
		}
	}
}
