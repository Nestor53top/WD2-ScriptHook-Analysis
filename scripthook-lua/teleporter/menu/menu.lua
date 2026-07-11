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
Menu = menu

menu:SetTitle("Teleporter | Nickwasused")

-- Items
MenuItems = {}
include("./locations/alcatraz.lua")
include("./locations/blume.lua")
include("./locations/burningman.lua")
include("./locations/zero.lua")
include("./locations/coit.lua")
include("./locations/dedsec.lua")
include("./locations/dusanpenthouse.lua")
include("./locations/fbi.lua")
include("./locations/fortpoint.lua")
include("./locations/galilel.lua")
include("./locations/haum.lua")
include("./locations/horatio.lua")
include("./locations/invite.lua")
include("./locations/movie.lua")
include("./locations/newdawn.lua")
include("./locations/noodle.lua")
include("./locations/somalabs.lua")
include("./locations/stadium.lua")
include("./locations/starthouse.lua")
include("./locations/sutrotower.lua")
include("./locations/tidis.lua")
include("./locations/triadhq.lua")
include("./locations/ubi.lua")
include("./locations/wkz.lua")
include("./locations/yacht.lua")

include("./locations/ceo.lua")
include("./locations/hacktheworld.lua")
include("./locations/ship.lua")


for _,data in ipairs(MenuItems) do
	menu:AddButton(unpack(data))
end

-- Key Bind
ScriptHook.RegisterKeyHandler("menu", function()
	menu:Toggle()
end)