local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Movie Studio")

	menu:AddButton("Outside", function()
		teleport(1781.207275, -156.046768, 28.354439)
	end)
	menu:AddButton("Inside", function()
		LoadLayer("sf_04_moviestudio_lma")
		teleport(1814.354248, -166.817581, 27.874928)
	end)

	return menu
end

table.insert(MenuItems, { "Movie Studio", "Teleport to the Movie Studio", Script():CacheMenu(TeleportMenu) })