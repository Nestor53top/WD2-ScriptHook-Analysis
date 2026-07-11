local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Horatio House")

	menu:AddButton("Inside", function()
		LoadLayer("oak_02_fruitvale_horatiohouse")
		teleport(-2760.670898, 251.119873, 22.001978)
	end)

	return menu
end

table.insert(MenuItems, { "Horatio House", "Teleport to the Horatio House", Script():CacheMenu(TeleportMenu) })