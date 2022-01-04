-- **********************************************
-- *        TELESCOPE CONFIGURATION FILE        *
-- **********************************************

-- https://github.com/nvim-telescope/telescope.nvim
-- https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
    find_command = {'rg', '--files', '--hidden', '-g', '!.git'}}

  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    fzy_native = {
      override_generic_sorter = false,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
    },
    bookmarks = {
      -- Available: 'brave', 'google_chrome', 'safari', 'firefox'
      selected_browser = 'google_chrome',

      -- Either provide a shell command to open the URL
      url_open_command = 'open',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = nil,

      -- Provide a custom profile name for Firefox
      firefox_profile_name = nil,
    },
  
    -- please take a look at the readme of the extension you want to configure
  }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('bookmarks')

-- keymaps for telescope
-- =====================

-- vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>tg', ':Telescope live_grep<cr>', { noremap = true })
