local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Start House")

	menu:AddButton("Outside", function()
		teleport(1120.954590, -2587.916594, 18.078384)
	end)
	menu:AddButton("Inside", function()
		LoadLayer("mar_02_marcusapartment_lma")
		teleport(1124.191162, -2595.979004, 22.086386)
	end)

	return menu
end

table.insert(MenuItems, { "Start House", "Teleport to the Start House", Script():CacheMenu(TeleportMenu) })