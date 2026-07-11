local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Sutro Tower")

	menu:AddButton("Inside", function()
		LoadLayer("sf_06_sutro_tower_lma")
		teleport(1289.464233, 1512.924561, 168.296631)
	end)
	
	menu:AddButton("Tower Top", function()
		teleport(1318.044434, 1498.595459, 284.284180)
	end)

	return menu
end

table.insert(MenuItems, { "Sutro Tower", "Teleport to the Sutro Tower", Script():CacheMenu(TeleportMenu) })