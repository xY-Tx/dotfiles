-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
require("format")

return {
	-------------------------------
	-- Basic settings
	-------------------------------
	automatically_reload_config = true,
	use_ime = true,
	cursor_thickness = 2,
	cursor_blink_rate = 0,
	colors = {
		cursor_fg = "black",
		cursor_bg = "white",
	},

	-- ime_cursor_bg = "red",
	default_cursor_style = "BlinkingBlock",
	leader = {
		key = "a",
		mods = "CTRL",
		timeout_milliseconds = 2000,
	},

	-------------------------------
	-- Window settings
	-------------------------------
	initial_cols = 120,
	initial_rows = 40,
	cell_width = 1.1,
	line_height = 1.1,
	adjust_window_size_when_changing_font_size = false,

	-------------------------------
	-- Tab settings
	-------------------------------
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	tab_max_width = 100,
	hide_tab_bar_if_only_one_tab = true,
	show_tabs_in_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
	-- window_decorations = "RESIZE",
	-- colors = {
	-- 	tab_bar = {
	-- 		inactive_tab_edge = "none",
	-- 	},
	-- },

	-------------------------------
	-- Color settings
	-------------------------------
	-- color_scheme = "Ryuuko",
	-- color_scheme = "catppuccin-macchiato",
	color_scheme = "catppuccin-frappe",
	-- color_scheme = "EverForest Dark (Gogh)",
	window_background_opacity = 0.95,
	macos_window_background_blur = 20,

	-------------------------------
	-- Font settings
	-------------------------------
	font = wezterm.font("Moralerspace Krypton", {
		-- font = wezterm.font("Moralerspace Argon", {
		weight = "Regular",
		stretch = "Normal",
		style = "Normal",
	}),
	font_size = 11,

	-------------------------------
	-- Key settings
	-------------------------------
	keys = {
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({
				domain = "CurrentPaneDomain",
			}),
		},
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({
				domain = "CurrentPaneDomain",
			}),
		},
		{
			key = "[",
			mods = "CTRL",
			action = wezterm.action.PaneSelect,
		},
	},
}
