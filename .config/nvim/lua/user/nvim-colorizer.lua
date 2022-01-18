--[[             _                           _            _
 _ ____   _(_)_ __ ___         ___ ___ | | ___  _ __(_)_______ _ __
| '_ \ \ / / | '_ ` _ \ _____ / __/ _ \| |/ _ \| '__| |_  / _ \ '__|
| | | \ V /| | | | | | |_____| (_| (_) | | (_) | |  | |/ /  __/ |
|_| |_|\_/ |_|_| |_| |_|      \___\___/|_|\___/|_|  |_/___\___|_|
]]

-- See https://github.com/norcalli/nvim-colorizer.lua for more information.
require'colorizer'.setup(
    {'*';},
{
	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = true;         -- "Name" codes like Blue
	RRGGBBAA = true;        -- #RRGGBBAA hex codes
	rgb_fn   = true;        -- CSS rgb() and rgba() functions
	hsl_fn   = true;        -- CSS hsl() and hsla() functions
	css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode     = 'background'; -- Set the display mode.
  }
)
