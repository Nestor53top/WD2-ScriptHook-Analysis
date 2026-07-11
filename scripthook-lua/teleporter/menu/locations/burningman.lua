local function setweather()
	PushEnvironmentWeatherOverride(WeatherIDs["SanFran.Clear.Fog_Dense.MI_BurningMan_1"], 1)
end

local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Burningman")

	menu:AddButton("Teleport to Burningman", function()
		LoadLayer("oak_05_burningman_lma")
		ClearWanted()
		teleport(-2615.465820, -2793.795410, 20.495592)
		SetTimeOfDayHourAndMinute(tonumber(0), tonumber(0))
		print("Successfully changed time of day to "..hour..":"..minute)
	end)
	menu:AddButton("Set Burningman Weather", function()
		setweather()
	end)

	return menu
end

table.insert(MenuItems, { "Burningman", "Teleport to Burningman", Script():CacheMenu(TeleportMenu) })