-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action

-- This is where you actually apply your config choices
-- To get a pipe character when pressing (left) ⌥l
config.send_composed_key_when_left_alt_is_pressed = true

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- Use an opaque background
config.window_background_opacity = 1
config.macos_window_background_blur = 10

-- Ensure Control-Shift-LeftArrow and Control-Shift-RightArrow are passed through to tmux
-- Add the key bindings configuration
config.keys = {
	-- Disable specific key combinations
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = act.DisableDefaultAssignment,
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = act.DisableDefaultAssignment,
	},
}

-- local light_theme = "Tokyo Night Day"
-- local light_theme = "Catppuccin Latte"
local light_theme = "Solarized (light) (terminal.sexy)"
-- local light_theme = "Alabaster"
-- local light_theme = "Solarized Light (Gogh)"

-- local dark_theme = "Tokyo Night"
-- local dark_theme = "Aura (Gogh)"
-- local dark_theme = "Andromeda"
-- local dark_theme = "Solarized Dark - Patched"
-- local dark_theme = "Solarized Darcula"
-- local dark_theme = "Solarized Dark Higher Contrast"
-- local dark_theme = "Sundried"
-- local dark_theme = "Solarized (dark) (terminal.sexy)"
-- local dark_theme = "nightfox"
local dark_theme = "NightOwl (Gogh)"

-- Function to get the appearance
local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark" -- default to dark if gui isn't available
end

-- Switch theme using current system settings (dark/light)
if get_appearance():find("Dark") then
	config.color_scheme = dark_theme
else
	config.color_scheme = light_theme
end

--- and finally, return the configuration to wezterm
return config
