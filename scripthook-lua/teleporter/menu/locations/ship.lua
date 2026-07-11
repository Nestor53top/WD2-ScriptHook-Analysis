local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Ship")

	menu:AddButton("Outside", function()
		teleport(3142.633789, -1845.312012, 23.890188)
	end)
	menu:AddButton("Inside", function()
		teleport(3119.286621, -1867.510498, 13.983264)
	end)

	return menu
end

table.insert(MenuItems, { "Ship [Not Working]", "Teleport to Ship Locations", Script():CacheMenu(TeleportMenu) })