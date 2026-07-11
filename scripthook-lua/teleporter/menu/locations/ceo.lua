local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Ceo House")

	menu:AddButton("Outside", function()
		teleport(985.569519, 2621.929932, 70.018988)
	end)
	menu:AddButton("Inside", function()
		LoadLayer("sf_06_ceohouse_lma")
		teleport()
	end)

	return menu
end

table.insert(MenuItems, { "Ceo House [Not Working]", "Teleport to the Ceo House", Script():CacheMenu(TeleportMenu) })