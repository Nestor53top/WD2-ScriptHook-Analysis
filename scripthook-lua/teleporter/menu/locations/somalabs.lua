local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Soma Rensenselabs")

	menu:AddButton("Lab", function()
		LoadLayer("sf_08_soma_rensenselabs_hma")
		LoadLayer("sf_08_soma_rensenselabs_sas")
		teleport(354.804749, 705.479004, -10.3062401)
	end)
	menu:AddButton("Lab 2", function()
		LoadLayer("sf_08_soma_rensenselabs_sas")
		teleport(308.218262, 677.031860, -11.407912)
	end)

	return menu
end

table.insert(MenuItems, { "Soma Rensenselabs", "Teleport to the Soma Rensenselabs", Script():CacheMenu(TeleportMenu) })