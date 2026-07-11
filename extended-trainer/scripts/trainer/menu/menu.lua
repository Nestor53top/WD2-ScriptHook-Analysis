--Custom scripts can be added here, in this example TestMod.lua is enabled by default
--TheSnitcher.lua is included as commented example, if you decide to install this mod or any other, then add it to "Mods" directory and remove -- from the ModList
--You can add as many entries as you want, as long as entries follow the same format
local ModList = {
    "DebugMenu.lua",
	--"TheSnitcher.lua",
}

-- Menu Utility
local script = Script()

function script:CacheMenu(menu_callback)
	local menu_cached = nil
	return function()
		menu_cached = menu_cached or menu_callback()
		return menu_cached
	end
end

-- Menu
local menu = UI.SimpleMenu()
SimpleTrainerMenu = menu

menu:SetTitle("WD2E TRAINER")

-- Items
SimpleTrainerMenuItems = {}
include("Player.lua")
include("Clothing.lua")
include("Camera.lua")
include("Teleport.lua")
include("Vehicle.lua")
include("Environment.lua")

for _, file in ipairs(ModList) do
    include("Mods/" .. file)
end

for _,data in ipairs(SimpleTrainerMenuItems) do
	menu:AddButton(unpack(data))
end

-- Key Bind
ScriptHook.RegisterKeyHandler("menu", function()
	menu:Toggle()
end)

-- DEBUG
if __isdebugbuild() then
	menu:Activate()
end