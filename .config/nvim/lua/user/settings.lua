-- ******************************
-- *          SETTINGS          *
-- ******************************

-- See :options

local options = {

    expandtab = true,
    smarttab = true,
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true,
    autoindent = true,

    hlsearch = true,
    incsearch = true,
    ignorecase = true,
    smartcase = true,

    termguicolors = true,
    showmode = true,
    splitbelow = true,
    splitright = true,
    wrap = true,
    scrolloff = 3,
    fileencoding = 'utf-8',

    number = true,
    relativenumber = true,
    cursorline = true,
    wildmenu = true,
    completeopt = 'menuone,noselect,noinsert',

    hidden = true,
    mouse = "a",
    pastetoggle = '<F11>',
    listchars = 'tab:➱ ,space:·,trail:+,eol:⮰',
    showtabline = 0,
}

for k,v in pairs(options) do
    vim.opt[k] = v
end
