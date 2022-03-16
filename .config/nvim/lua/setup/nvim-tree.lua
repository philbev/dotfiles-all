--  _   _       _                 _                   _
-- | \ | |_   _(_)_ __ ___       | |_ _ __ ___  ___  | |_   _  __ _
-- |  \| \ \ / / | '_ ` _ \ _____| __| '__/ _ \/ _ \ | | | | |/ _` |
-- | |\  |\ V /| | | | | | |_____| |_| | |  __/  __/_| | |_| | (_| |
-- |_| \_| \_/ |_|_| |_| |_|      \__|_|  \___|\___(_)_|\__,_|\__,_|

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
