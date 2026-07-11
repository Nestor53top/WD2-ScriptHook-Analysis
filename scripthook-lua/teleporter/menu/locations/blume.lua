local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Blume")

	menu:AddButton("Blume CTOS Server Farm (Outside)", function()
		teleport(-613.188721, -1358.770752, 16.090664)
	end)
	menu:AddButton("Blume CTOS Server Farm (Serverroom)", function()
		LoadLayer("sf_09_ctos_data_center_lma")
		teleport(-633.506470, -1389.237549, -2.054199)
	end)
	menu:AddButton("Blume Campus (Outside)", function()
		teleport(729.503357, 1729.959229, 60.518436)
	end)
	menu:AddButton("Blume Campus (Inside)", function()
		LoadLayer("sf_08_blume_campus_hma")
		LoadLayer("sf_08_blume_campus_sas")
		teleport(738.705383, 1736.158081, 61.004967)
	end)
	menu:AddButton("Blume Campus (Serverroom)", function()
		LoadLayer("sf_08_blume_campus_sas")
		LoadLayer("sf_08_blume_campus_hma")
		teleport(854.931946, 1759.926758, 27.640955)
	end)

	return menu
end

table.insert(MenuItems, { "Blume", "Teleport to Blume Locations", Script():CacheMenu(TeleportMenu) })