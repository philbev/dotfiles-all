-- _   _       _
-- | \ | |_   _(_)_ __ ___         ___ _ __ ___  _ __
-- |  \| \ \ / / | '_ ` _ \       / __| '_ ` _ \| '_ \
-- | |\  |\ V /| | | | | | |  _  | (__| | | | | | |_) |
-- |_| \_| \_/ |_|_| |_| |_| (_)  \___|_| |_| |_| .__/


-- ~/.config/nvim/lua/user/completion.lua

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
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
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
	sources = cmp.config.sources({
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		-- { name = 'ultisnips' },		-- For ultisnips users.
		{ name = 'path' },
		{ name = 'dictionary', keyword_length = 4 },
		{ name = 'zsh' },
	}, {
			-- { name = 'spell', keyword_length = 4 },
	}),
	formatting = {
		-- Youtube: How to set up nice formatting for your sources.
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[Buf]",
				nvim_lsp = "[Lsp]",
				nvim_lua = "[Api]",
				path = "[Path]",
				luasnip = "[Luasnip]",		-- For luasnip users.
				dictionary = 'Dict'
				-- ultisnips = "[ultisnip]",	-- For ultisnips users.
				-- spell = "[spell]",
			},
		},
	}
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
			{ name = 'cmdline' }
	})
})

local status_fine,dict = pcall(require, 'cmp_dictionary')
if not status_fine then
	return
end

dict.setup({
	dic = {
		["*"] = { "/usr/share/dict/words" },
		--["lua"] = "path/to/lua.dic",
		--["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
		--filename = {
		--	["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
		--},
		--filepath = {
		--	["%.tmux.*%.conf"] = "path/to/tmux.dic"
		--},
	},
	-- The following are default values, so you don't need to write them if you don't want to change them
	exact = 2,
	first_case_insensitive = false,
	document = false,
	document_command = "wn %s -over",
	async = false,
	capacity = 5,
	debug = false,
})
