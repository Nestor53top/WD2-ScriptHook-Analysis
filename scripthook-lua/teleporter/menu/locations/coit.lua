local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Coit Tower")

	menu:AddButton("top", function()
		teleport(652.669189, -566.513428, 133.730072)
	end)
	
	menu:AddButton("bottom", function()
		teleport(650.781433, -598.100098, 83.507164)
	end)

	return menu
end

table.insert(MenuItems, { "Coit Tower", "Teleport to the Coit Tower", Script():CacheMenu(TeleportMenu) })