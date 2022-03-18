#!/usr/bin/lua
--  _                          _        _
-- | |   _   _  __ _ ___ _ __ (_)_ __  | |_   _  __ _
-- | |  | | | |/ _` / __| '_ \| | '_ \ | | | | |/ _` |
-- | |__| |_| | (_| \__ \ | | | | |_) || | |_| | (_| |
-- |_____\__,_|\__,_|___/_| |_|_| .__(_)_|\__,_|\__,_|
--                              |_|

-- ~/.config/nvim/lua/user/luasnip.lua

-- See https://github.com/L3MON4D3/LuaSnip
-- See teej's on YouTube - https://www.youtube.com/watch?v=Dn800rlPIho&list=WL&index=8


    local ls = require"luasnip"
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require("luasnip.util.events")
    local ai = require("luasnip.nodes.absolute_indexer")

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
--   ext_opts = {
--     [types.choiceNode] = {
--       active = {
--         virt_text = { { "<-", "Error" } },
--       },
--     },
--   },
}
vim.keymap.set({"i", "s"}, "<c-k>", function()
if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<s-tab>", function()
if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<tab>", function()
if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true })

    ls.snippets = {
    	lua = {
    		s({trig = "ternary", dscr = 'Ternary operator'}, {
    			-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    			i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    		})
    	}
    }

