local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Noodle")

	menu:AddButton("Outside", function()
		teleport(-641.041992, 3120.737305, 20.515034)
	end)
	menu:AddButton("Server", function()
		LoadLayer("sv_01_officeplex_lma_mapsroom02")
		teleport(-811.707397, 3168.902832, 9.005063)
	end)

	return menu
end

table.insert(MenuItems, { "Noodle", "Teleport to Noodle", Script():CacheMenu(TeleportMenu) })