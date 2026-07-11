local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Galilel")

	menu:AddButton("Outside", function()
		teleport(-1264.047852, 3043.673340, 18.010941)
	end)
	menu:AddButton("Roof", function()
		teleport(-1296.296387, 3097.360352, 71.068314)
	end)
	menu:AddButton("Inside", function()
		LoadLayer("sv_02_divisionx_lma_hangarfloor")
		teleport(-1279.329590, 3121.323730, 24.015215)
	end)

	return menu
end

table.insert(MenuItems, { "Galilel", "Teleport to Galilel Locations", Script():CacheMenu(TeleportMenu) })