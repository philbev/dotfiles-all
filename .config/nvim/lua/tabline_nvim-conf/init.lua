--[[
 _        _     _ _                         _
| |_ __ _| |__ | (_)_ __   ___   _ ____   _(_)_ __ ___
| __/ _` | '_ \| | | '_ \ / _ \ | '_ \ \ / / | '_ ` _ \
| || (_| | |_) | | | | | |  __/_| | | \ V /| | | | | | |
 \__\__,_|_.__/|_|_|_| |_|\___(_)_| |_|\_/ |_|_| |_| |_|
]]

    require'tabline'.setup {
      -- Defaults configuration options
      enable = true,
      options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
        section_separators = {'', ''},
        component_separators = {'', ''},
        max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
        show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = true, -- this appends [bufnr] to buffer section,
        show_filename_only = false, -- shows base filename only instead of relative path in filename
      }
    }
    vim.cmd[[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
