local function InviteTeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("!nvite")

	menu:AddButton("Outside", function()
		teleport(839.594543, 686.046143, 31.725556)
	end)
	menu:AddButton("Inside", function()
		LoadLayer("sf_08_invite_lma")
		teleport(875.124451, 644.192627, 32.374151)
	end)
	menu:AddButton("Server", function()
		LoadLayer("sf_08_invite_lma")
		teleport(867.473633, 648.186096, 26.826643)
	end)
	menu:AddButton("Office", function()
		LoadLayer("sf_08_invite_lma")
		teleport(865.608154, 635.059937, 55.814030)
	end)

	return menu
end

table.insert(MenuItems, { "!nvite", "Teleport to !nvite Locations", Script():CacheMenu(InviteTeleportMenu) })