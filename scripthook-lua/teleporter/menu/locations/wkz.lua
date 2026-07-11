local function WkzTeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Wkz")

	menu:AddButton("Wkz San Francisco", function()
		teleport(141.394165, 1121.187500, 16.588711)
	end)
	menu:AddButton("Wkz San Francisco 2", function()
		teleport(296.305817, 650.211182, 33.940899)
	end)
	menu:AddButton("Wkz Oakland", function()
		teleport(-1992.954102, -928.067017, 16.382216)
	end)
	menu:AddButton("Wkz San Francisco Studio (Outside)", function()
		teleport(359.561829, -718.436523, 17.058578)
	end)
	menu:AddButton("Wkz San Francisco Studio (Inside)", function()
		LoadLayer("sf_02_wkz_tv_station_lma")
		teleport(331.531677, -691.857239, 17.555064)
	end)

	return menu
end

table.insert(MenuItems, { "Wkz", "Teleport to Wkz Locations", Script():CacheMenu(WkzTeleportMenu) })