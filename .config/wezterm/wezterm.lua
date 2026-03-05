-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
-- require("format")

return {
	-------------------------------
	-- Basic settings
	-------------------------------
	automatically_reload_config = true,
	use_ime = true,
	cursor_thickness = 2,
	cursor_blink_rate = 800,
	-- colors = {
	-- 	cursor_fg = "black",
	-- 	cursor_bg = "white",
	-- },

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
	initial_cols = 240,
	initial_rows = 80,
	cell_width = 1.1,
	line_height = 1.1,
	adjust_window_size_when_changing_font_size = false,
	-- window_padding = {
	-- 	left = 0,
	-- 	right = 0,
	-- 	top = 0,
	-- 	bottom = 0,
	-- },

	-------------------------------
	-- Tab settings
	-------------------------------
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	tab_max_width = 100,
	hide_tab_bar_if_only_one_tab = true,
	show_tabs_in_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
	-- show_close_tab_button_in_tabs = false,
	window_decorations = "RESIZE",
	window_frame = {
		inactive_titlebar_bg = "none",
		active_titlebar_bg = "none",
	},
	-- window_background_gradient = {
	-- 	colors = { "#555555" },
	-- },
	-- colors = {
	-- 	tab_bar = {
	-- 		inactive_tab_edge = "none",
	-- 	},
	-- },

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local background = "#5c6d74"
		local foreground = "#FFFFFF"

		if tab.is_active then
			background = "#ae8b2d"
			foreground = "#FFFFFF"
		end

		local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

		return {
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = title },
		}
	end),

	-------------------------------
	-- Color setting
	-------------------------------
	-- color_scheme = "Ryuuko",
	-- color_scheme = "Dracula",
	-- color_scheme = "Tokyo Night",
	-- color_scheme = "catppuccin-macchiato",
	-- color_scheme = "catppuccin-frappe",
	-- color_scheme = "catppuccin-mocha",
	-- color_scheme = "Maia (Gogh)",
	-- color_scheme = "Mariana",
	-- color_scheme = "Material (Gogh)",
	-- color_scheme = "Material (terminal.sexy)",
	-- color_scheme = "PaleNightHC",
	-- color_scheme = "Aardvark Blue",
	-- color_scheme = "Neon",
	-- color_scheme = "Neon (terminal.sexy)",
	-- color_scheme = "Neon Night (Gogh)",
	-- color_scheme = "Outrun Dark (base16)",
	-- color_scheme = "Pandora",
	-- color_scheme = "Omni (Gogh)",
	color_scheme = "Nova (base16)",
	-- window_background_opacity = 0.95,
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
			key = "]",
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
		{
			key = "f",
			mods = "CMD|SHIFT",
			action = wezterm.action.ToggleFullScreen,
		},
	},
}
