-- TELESCOPE CONFIGURATION
require('telescope').setup{
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = { preview_cutoff = 90, },
        },
    },
    vimgrep_arguments = {
      'rg',
      '--color=always',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-u' -- thats the new thing
    },
    extensions = {
        fzf = {
            fuzzy = true
        },
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('media_files')


-- ****************** LSP CONFIGURATION *********************

-- Python
--require'lspconfig'.pyright.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.pylsp.setup{on_attach=require'completion'.on_attach}

-- Lua

-- set the path to the sumneko installation
local system_name = "Linux" -- (Linux, macOS, or Windows)
--local sumneko_root_path = '/path/to/lua-language-server'
local sumneko_root_path = '/home/phil/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require('lspconfig').sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    -- An example of settings for an LSP server.
    --    For more options, see nvim-lspconfig
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        }
    },

    on_attach = require'completion'.on_attach
})
