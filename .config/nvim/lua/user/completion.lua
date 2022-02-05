-- _   _       _
-- | \ | |_   _(_)_ __ ___         ___ _ __ ___  _ __
-- |  \| \ \ / / | '_ ` _ \       / __| '_ ` _ \| '_ \
-- | |\  |\ V /| | | | | | |  _  | (__| | | | | | |_) |
-- |_| \_| \_/ |_|_| |_| |_| (_)  \___|_| |_| |_| .__/
-- |_|

local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
	return
end

local lspkind = require "lspkind"
-- lspkind.init()

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- If you want tab completion :'(
		--  First you have to just promise to read `:help ins-completion`.
		--
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	},
	formatting = {
		-- Youtube: How to set up nice formatting for your sources.
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				ultisnips = "[ultisnip]",
				spell = "[spell]",
			},
		},
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'ultisnips' }, -- For ultisnips users.
		{ name = 'path' },
		{ name = 'zsh' },
	}, {
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'spell', keyword_length = 4 },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
