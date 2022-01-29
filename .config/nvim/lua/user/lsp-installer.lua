--  _                    ___           _        _ _           _
-- | |    ___ _ __      |_ _|_ __  ___| |_ __ _| | | ___ _ __| |_   _  __ _
-- | |   / __| '_ \ _____| || '_ \/ __| __/ _` | | |/ _ \ '__| | | | |/ _` |
-- | |___\__ \ |_) |_____| || | | \__ \ || (_| | | |  __/ | _| | |_| | (_| |
-- |_____|___/ .__/     |___|_| |_|___/\__\__,_|_|_|\___|_|(_)_|\__,_|\__,_|
--           |_|

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
