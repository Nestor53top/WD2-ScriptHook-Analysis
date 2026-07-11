local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Stadium")

	menu:AddButton("Seats", function()
		teleport(-96.434723, 975.228210, 60.001828)
	end)
	
	menu:AddButton("Field", function()
		teleport(-163.708557, 971.315735, 19.078425)
	end)

	return menu
end

table.insert(MenuItems, { "Stadium", "Teleport to the Stadium", Script():CacheMenu(TeleportMenu) })