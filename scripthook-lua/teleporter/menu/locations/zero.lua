local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Center of the Map")

	menu:AddButton("Center of the Map", function()
		teleport(0, 0, 15)
	end)

	return menu
end

table.insert(MenuItems, { "Center of the Map", "Teleport to x=0, y=0, z=15", Script():CacheMenu(TeleportMenu) })