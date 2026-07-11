local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Hacktheworld")

	menu:AddButton("Earth View (Freecam)", function()
		teleport(779.580750, 967.506226, 140.241776)
	end)
	menu:AddButton("Dublin", function()
		teleport(779.581482, 967.506409, 140.241867)
	end)

	return menu
end

table.insert(MenuItems, { "Hacktheworld [Not Working]", "Teleport to Hacktheworld", Script():CacheMenu(TeleportMenu) })