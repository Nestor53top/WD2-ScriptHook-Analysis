local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Alcatraz")

	menu:AddButton("Teleport to Alcatraz", function()
		teleport(237.084930, -1945.961426, 37.011242)
	end)
	menu:AddButton("Teleport to Alcatraz (Inside)", function()
		teleport(272.934814, -1981.156372, 37.099851)
	end)

	return menu
end

table.insert(MenuItems, { "Alcatraz", "Teleport to Alcatraz Locations", Script():CacheMenu(TeleportMenu) })