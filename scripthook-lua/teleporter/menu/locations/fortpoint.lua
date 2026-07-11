local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Fort Point")

	menu:AddButton("Outside", function()
		teleport(2119.341797, -1053.109009, 16.557859)
	end)
	menu:AddButton("Inside", function()
		teleport(2155.328857, -1080.221436, 16.564962)
	end)


	return menu
end

table.insert(MenuItems, { "Fort Point", "Teleport to Fort Point Locations", Script():CacheMenu(TeleportMenu) })