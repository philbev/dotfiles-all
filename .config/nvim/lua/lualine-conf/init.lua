require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {'filename',
                file_status = true,   -- displays file status (readonly status, modified status)
                path = 2,             -- 0 = just filename, 1 = relative path, 2 = absolute path
                shorting_target = 40, -- Shortens path to leave 40 space in the window
                -- for other components. Terrible name any suggestions?
                symbols = {
                    modified = '[+]',      -- when the file was modified
                    readonly = '[-]',      -- if the file is not modifiable or readonly
                    unnamed = '[No Name]', -- default display name for unnamed buffers
                }
            }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {''},
        lualine_x = {''},
        -- lualine_c = {'filename'},
        -- lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {require'tabline'.tabline_buffers},
        lualine_x = {require'tabline'.tabline_tabs},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {}
}

