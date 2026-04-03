local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover)
	local bg_active = "#D86B6B"
	local fg_active = "#2F1010"

	local bg_inactive = "#D5F0D0"
	local fg_inactive = "#2F522F"

	local bg_hover = "#BFE06D"
	local fg_hover = "#394715"

	local bg
	local fg

	if tab.is_active then
		bg = bg_active
		fg = fg_active
	elseif hover then
		bg = bg_hover
		fg = fg_hover
	else
		bg = bg_inactive
		fg = fg_inactive
	end

	local pad = "  "

	return {
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = pad .. tab.active_pane.title .. pad },
	}
end)
