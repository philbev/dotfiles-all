--[[
          _     _      _     _                                     __
__      _| |__ (_) ___| |__ | | _____ _   _        ___ ___  _ __  / _|
\ \ /\ / / '_ \| |/ __| '_ \| |/ / _ \ | | |_____ / __/ _ \| '_ \| |
 \ V  V /| | | | | (__| | | |   <  __/ |_| |_____| (_| (_) | | | |  _|
  \_/\_/ |_| |_|_|\___|_| |_|_|\_\___|\__, |      \___\___/|_| |_|_|
                                      |___/
]]

local wk = require('which-key')
wk.setup{
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 10, 2, 10 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 5, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
    }

-- local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
    b = {
        name = 'Barbar',
        b = {'<cmd>BufferOrderByBufferNumber<CR>', 'Order tabs by number'},
        d = {'<cmd>BufferOrderByDirectory<CR>', 'Order tabs by number'},
        l = {'<cmd>BufferOrderByLanguage<CR>', 'Order tabs by number'}

    },
    n = {'<cmd>NvimTreeToggle<cr>', 'NvimTree'},
    q = {':q!<cr>', '[:q!] Quit discard changes'},
    s = {':w | source %<cr>', '[:w|so%] Write & source'},
    w = {':w<cr>', '[:w] Write'},
    x = {':x<cr>', '[:x] Write & exit'},
    f = {
        name = "Telescope", -- optional group name
        g = { '<cmd>Telescope live_grep<cr>', 'Live grep' },
        h = { "<cmd>Telescope help_tags<cr>", "Help-tags" }, -- create a binding with label
        l = { "<cmd>Telescope highlights<cr>", "Highlights" }, -- create a binding with label
        f = { "<cmd>Telescope find_files<cr>", "Find_files" }, -- create a binding with label
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=true }, -- additional options for creating the keymap
        -- n = { "New File" }, -- just a label. don't create any mapping
        -- e = "Edit File", -- same as above
        -- ["1"] = "which_key_ignore",  -- special label to hide it in the popup
        -- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },
}, { prefix = "<leader>" })

