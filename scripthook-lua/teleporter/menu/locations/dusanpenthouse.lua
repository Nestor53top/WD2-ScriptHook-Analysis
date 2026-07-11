local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Dusan Penthouse")

	menu:AddButton("Dusan Penthouse", function()
		LoadLayer("sf_08_dusanpenthouse_lma")
		teleport(298.337494, 285.072327, 235.018411)
	end)

	return menu
end

table.insert(MenuItems, { "Dusan Penthouse", "Teleport to Dusans Penthouse", Script():CacheMenu(TeleportMenu) })