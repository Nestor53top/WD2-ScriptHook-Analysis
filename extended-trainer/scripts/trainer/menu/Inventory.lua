--This file has been disabled, parts of it have been merged with other categories
--[[
function RechargeBattery()
	ExecuteReward_V2(GetLocalPlayerEntityId(), "Items.13654314691341285506", 0)
	ScriptHook.ShowNotification("Botnet recharged")
end

function ClearInventory()
	SwitchLocalPlayerInventoryToEmpty()
end

function ResetInventory()
	SwitchLocalPlayerInventoryToNormal()
end

function UnlockAllSkills()
	-- TODO, give all skill items
end

function ConnectToDroneCall()
	SetFlyingDroneAvailable(1)
	SetFlyingDroneCannotDeploy(0)
	MakeRCEntityDisconnectAvailable(1)
	ConnectToFlyingDrone(GetLocalPlayerEntityId())
end

function DisconnectFromDroneCall()
	DisconnectFromFlyingDrone(GetLocalPlayerEntityId())
	CallBackFlyingDrone(GetLocalPlayerEntityId())
end

function ConnectToToyCarCall()
	SetToyCarAvailable(1)
	SetToyCarCannotDeploy(0)
	MakeRCEntityDisconnectAvailable(1)
	ConnectToToyCar(GetLocalPlayerEntityId())
end

function DisconnectFromToyCarCall()
	DisconnectFromToyCar(GetLocalPlayerEntityId())
	CallBackToyCar(GetLocalPlayerEntityId())
end

-- Inventory items
function OpenItemCatoryMenu(title, tbl)
	local menu = UI.SimpleMenu()
	menu:SetTitle(title)
	
	for k,v in pairsByKeys(tbl) do
		menu:AddButton(k, k, function(menu, text, hint, index) 
			ScriptHook.AddInventoryItem(tbl[text], 1)
			ScriptHook.ShowNotification("Added item " .. text)
		end)
	end

	return menu
end

local Item_Categories = {
	{ "Generic", Items },
	{ "Access Codes", ItemAccessCodes },
	{ "Access Codes Coop", ItemAccessCodesCoop },
	{ "Access Code Rare Car", ItemAccessCodesRareCar },
	{ "Skills", ItemSkills },
	{ "Car Hacking Rewards", ItemCarHackingRewards },
	{ "Cash", ItemCash },
	{ "Clothing Bundles",ItemClothingBundles },
	{ "Clothing Kiosk",ItemClothingKiosk },
	{ "Clothing Reward", ItemClothingReward },
	{ "Clothing Biker",ItemClothingShopsBiker },
	{ "Clothing Highend", ItemClothingShopsHighEndSuits },
	{ "Clothing HipHop", ItemClothingShopsHipHop },
	{ "Clothing Hipster", ItemClothingShopsHipster },
	{ "Clothing Normcore", ItemClothingShopsNormcore },
	{ "Clothing Urban Skate",ItemClothingShopsUrbanSkate },
	{ "Clothing Default", ItemClothingDefaultSkin },
	{ "Clothing ULC", ItemClothingULC },
	{ "Clothing Vending Machines", ItemClothingVendingMachines },
	{ "Clothing Collectibles", ItemClothingCollectibles },
	{ "Components", ItemComponents },
	{ "Emotes", ItemEmotes },
	{ "Followers", ItemFollowers },
	{ "Narrative",ItemsNarrative },
	{ "Progression", ItemsProgression },
	{ "Projectiles", ItemsProjectiles },
	{ "Races", ItemsRaces },
	{ "RCSkins",ItemsRCSkins },
	{ "Survival Guide", ItemsSurvivalGuide },
	{ "Upgrades", ItemUpgrades },
	{ "Valueables", ItemValueables },
	{ "Vehicle Decals", ItemVehicleDecals },
	{ "Weapon Decals", ItemWeaponDecals },
	{ "Yacht", ItemYacht }
}

function OpenItemCategoriesMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Select Item Category")
	
	for _,v in pairsByKeys(Item_Categories) do
		local name, tbl = unpack(v)
		menu:AddButton(name, Script():CacheMenu(function()
			return OpenItemCatoryMenu(name, tbl)
		end))
	end

	return menu
end

function UnlockAllEmotes()
	for k,v in pairsByKeys(ItemEmotes) do
		ScriptHook.AddInventoryItem(ItemEmotes[k], 1)
	end

	ScriptHook.ShowNotification("Unlocked all emotes")
end

-- Player Weapons
function InventoryMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Inventory")

	menu:AddButton("Give Item", "WARNING: Might corrupt save file", Script():CacheMenu(OpenItemCategoriesMenu))
	--menu:AddButton("Unlock all emotes", "Use all emotes with the F1-F11 keys", UnlockAllEmotes)
	menu:AddButton("Recharge Battery", "Instantly refill botnets", RechargeBattery)
	menu:AddButton("Clear Inventory", "Temporarily clears inventory", ClearInventory)
	menu:AddButton("Reset Inventory", "Resets cleared inventory to normal", ResetInventory)
	
	menu:AddButton("Equip Handgun", "Equips random hidden Handgun slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 0)
	end)
	
	menu:AddButton("Equip Assault Rifle", "Equips random hidden AR slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 1)
	end)
	
	menu:AddButton("Equip Shotgun", "Equips random hidden Shotgun slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 2)
	end)
	
	menu:AddButton("Equip Sniper", "Equips random hidden Sniper slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 3)
	end)
	
	menu:AddButton("Equip Launcher", "Equips random hidden Launcher slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 4)
	end)
	
	--menu:AddButton("Unlock all skills", UnlockAllSkills)
	--menu:AddButton("Connect To Drone", ConnectToDroneCall)
	--menu:AddButton("Disconnect From Drone", DisconnectFromDroneCall)
	--menu:AddButton("Connect To Toycar", ConnectToToyCarCall)
	--menu:AddButton("Disconnect From Toycar", DisconnectFromToyCarCall)
	
	return menu
end

table.insert(SimpleTrainerMenuItems, { "Inventory", "Give items, recharge battery, etc.", Script():CacheMenu(InventoryMenu) })
]]