local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("FBI Tower")

	menu:AddButton("Inside (Bottom)", function()
		LoadLayer("oak_01_civiccenter_dellumtower_sas")
		teleport(-2089.043457, -985.501709, 19.986208)
	end)
	menu:AddButton("Inside (Top)", function()
		LoadLayer("oak_01_civiccenter_dellumtower_hma")
		teleport(-2059.158447, -972.452515, 89.286774)
	end)

	return menu
end

table.insert(MenuItems, { "FBI Tower", "Teleport to the FBI Tower", Script():CacheMenu(TeleportMenu) })