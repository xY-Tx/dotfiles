local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover)
	local bg_active = "#f2b3b3"
	local bg_inactive = "#1f2937"
	local bg_hover = "#374151"

	local fg_active = "#414a7d"
	local fg_inactive = "#9ca3af"

	local bg
	if tab.is_active then
		bg = bg_active
	elseif hover then
		bg = bg_hover
	else
		bg = bg_inactive
	end

	local fg = tab.is_active and fg_active or fg_inactive

	-- ★ 全タブ共通の左右余白
	local pad = "  " -- ← 1文字分（2にすると広め）

	return {
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = pad .. tab.active_pane.title .. pad },
	}
end)
