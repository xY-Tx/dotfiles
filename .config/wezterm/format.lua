local wezterm = require("wezterm")

-- local function BaseName(s)
-- 	return string.gsub(s, "(.*[/\\])(.*)", "%2")
-- end
--
-- wezterm.on("format-window-title", function(tab)
-- 	return BaseName(tab.active_pane.foreground_process_name)
-- end)
--
-- local HEADER = "   " -- 文字化けしちゃってるかもしれませんが、アイコンフォント入ってます。
--
-- local SYMBOL_COLOR = { "#ffb2cc", "#a4a4a4" }
-- local FONT_COLOR = { "#dddddd", "#888888" }
-- local BACK_COLOR = "#2d2d2d"
-- local HOVER_COLOR = "#434343"
--
-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
-- 	local index = tab.is_active and 1 or 2
--
-- 	local bg = hover and HOVER_COLOR or BACK_COLOR
-- 	local zoomed = tab.active_pane.is_zoomed and "🔎 " or " "
--
-- 	return {
-- 		{ Foreground = { Color = SYMBOL_COLOR[index] } },
-- 		{ Background = { Color = bg } },
-- 		{ Text = HEADER .. zoomed },
--
-- 		{ Foreground = { Color = FONT_COLOR[index] } },
-- 		{ Background = { Color = bg } },
-- 		{ Text = tab.active_pane.title },
-- 	}
-- end)
--
--

function split(str, ts)
	-- 引数がないときは空tableを返す
	if ts == nil then
		return {}
	end

	local t = {}
	i = 1
	for s in string.gmatch(str, "([^" .. ts .. "]+)") do
		t[i] = s
		i = i + 1
	end

	return t
end

-- 各タブの「ディレクトリ名」を記憶しておくテーブル
local title_cache = {}

wezterm.on("update-status", function(window, pane)
	local pane_id = pane:pane_id()
	title_cache[pane_id] = "-"
	local process_info = pane:get_foreground_process_info()
	if process_info then
		local cwd = process_info.cwd
		-- 文字列を削除している
		-- 環境に応じて変えること
		local rm_home = string.gsub(cwd, os.getenv("HOME"), "")
		local prj = string.gsub(rm_home, "/Development/Projects", "")
		local dirs = split(prj, "/")
		local root_dir = dirs[1]
		title_cache[pane_id] = root_dir
	end
end)

-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
locat SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"
	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end
	local edge_foreground = background
	local pane = tab.active_pane
	local pane_id = pane.pane_id

	local cwd = "none"
	if title_cache[pane_id] then
		cwd = title_cache[pane_id]
	else
		cwd = "-"
	end

	local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. " [ " .. cwd .. " ] "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)
