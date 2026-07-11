local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Ubisoft Studio")

	menu:AddButton("Inside", function()
		teleport(-55.518135, 820.702087, 15.523249)
	end)
	menu:AddButton("Outside", function()
		teleport(-48.670208, 839.008118, 15.526115)
	end)

	return menu
end

table.insert(MenuItems, { "Ubisoft", "Teleport to the Ubisoft Studio", Script():CacheMenu(TeleportMenu) })