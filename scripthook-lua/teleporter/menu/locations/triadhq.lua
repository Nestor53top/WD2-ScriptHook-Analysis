local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Triad HQ")

	menu:AddButton("Outside", function()
		teleport(960.013428, -115.874542, 30.479439)
	end)
	menu:AddButton("Inside (bottom)", function()
		LoadLayer("sf_03_triad_hq_lma")
		teleport(960.989502, -125.960526, 30.477072)
	end)
	menu:AddButton("Inside (top)", function()
		LoadLayer("sf_03_triad_hq_lma")
		teleport(954.251404, -146.190186, 34.408264)
	end)

	return menu
end

table.insert(MenuItems, { "Triad HQ", "Teleport to Triad HQ Locations", Script():CacheMenu(TeleportMenu) })