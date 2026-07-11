local selectedFaction = "Police"

-- 
function SetAffiliationRelationshipMenu(name, id)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Set realtionship to " .. name)

	for k,v in pairsByKeys(RelationShips) do
		menu:AddButton(k, function(menu, text, hint, index) 
			SetSquadRelationship(id, RelationShips[k], GetLocalPlayerEntityId())
			ScriptHook.ShowNotification("Your relationship to " .. name .. " is now " .. k)
		end)
	end

	return menu
end

function OpenRelationshipMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Select a faction")

	for k,v in pairsByKeys(Affiliation) do
		menu:AddButton(k, Script():CacheMenu(function()
			return SetAffiliationRelationshipMenu(k, Affiliation[k])
		end))
	end

	return menu
end

-- 
function GetFelonyTypeID(felonyTypeName)
	return Factions[felonyTypeName]
end

function StartFelonySearch(level, faction)
	local felonyLevel = level
	local felonyType = GetFelonyTypeID(faction)

	ScriptHook.SetHeatLevel(level, felonyType)
end

function StartFelonyChase(level, faction, behaviour)
	local target = GetLocalPlayerEntityId()
	local felonyType = GetFelonyTypeID(faction)
	local felonyLevel = level
	local startAction = 2

	if behaviour == "search" then
		startAction = 3
	end

	FelonyStartChase(target, felonyType, felonyLevel, startAction)
end

-- Player Wanted
function FactionWantedMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Select a faction")

	for k,v in pairsByKeys(Factions) do
		menu:AddButton(k, function(menu, text, hint, index) 
			selectedFaction = text
			ScriptHook.ShowNotification("Faction selected: " .. selectedFaction)
		end)
	end

	return menu
end

function IsPoliceFactionSelected()
	return GetFelonyTypeID(selectedFaction) == 0
end

FactionToAffiliation = {
    [0] = 1, --Police
    [1] = 4, --FBI
    [3] = 5, --Prime Eight
    [6] = 9, --Tezcas
    [9] = 11, --Auntie Shu Boys
    [10] = 12, --580s
    [11] = 13, --Umeni Zulu
    [12] = 14, --Bratva
    [15] = 17 --Sons Of Ragnarok
}

function ConvertFactionToAffiliation(factionID)
    return FactionToAffiliation[factionID]
end

function OpenWantedMenuCall()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Faction - " .. selectedFaction)

	menu:AddButton("Change faction", "Select a faction to chase you", Script():CacheMenu(FactionWantedMenu))

	--[[
	menu:AddButton("Toggle", function()
		ScriptHook.ToggleFelonySystem()
		ScriptHook.ShowNotification("Toggled felony system")
	end)]]
	
	local searchButton = menu:AddButton("Felony - Add heat", "POLICE ONLY: Adds three heat levels", function()
		StartFelonySearch(2, selectedFaction)
		ScriptHook.ShowNotification("Added heat for "..selectedFaction)
	end)
	
	menu:AddButton("Felony - Start chase", "Attempts to start the chase state", function()
		StartFelonyChase(2, selectedFaction, "chase")
		ScriptHook.ShowNotification(selectedFaction .. " are chasing you")
	end)

	menu:AddButton("Felony - Start search", "Attempts to start the search/escape state", function()
		StartFelonyChase(2, selectedFaction, "search")
		ScriptHook.ShowNotification(selectedFaction .. " are searching for you")
	end)
	
	menu:AddButton("Felony - Vanish", "Attempts to clear your felony", function()
		FelonyEndChaseOrSearch(GetLocalPlayerEntityId(), GetFelonyTypeID(selectedFaction), 1)
		ScriptHook.ClearHeatLevel(GetFelonyTypeID(selectedFaction))
		ScriptHook.ShowNotification(selectedFaction .. " have lost interest you")
	end)
	
	menu:AddButton("Squad - Create Targeted Search", "Squad means restricted area enemies", function()
	SquadTryToCreateTargetedSearch_v3(ConvertFactionToAffiliation(GetFelonyTypeID(selectedFaction)), GetLocalPlayerEntityId(), GetLocalPlayerEntityId(), 0, 0, 0, "")
	ScriptHook.ShowNotification("Attempting to create Targeted Search: "..selectedFaction)
	end)
	
	menu:AddButton("Squad - Create Untargeted Search", "Squad means restricted area enemies", function()
	SquadTryToCreateUntargetedSearch_v2(ConvertFactionToAffiliation(GetFelonyTypeID(selectedFaction)), GetLocalPlayerEntityId(), GetLocalPlayerEntityId(), 0, 0)
	ScriptHook.ShowNotification("Attempting to create Untargeted Search: "..selectedFaction)
	end)
	
	menu:AddButton("Squad - Create Combat", "Squad means restricted area enemies", function()
	SquadTryToCreateCombat(ConvertFactionToAffiliation(GetFelonyTypeID(selectedFaction)), GetLocalPlayerEntityId(), GetLocalPlayerEntityId())
	ScriptHook.ShowNotification("Attempting to create Combat: "..selectedFaction)
	end)
	
	menu:AddButton("Squad - Set Wander", "Squad means restricted area enemies", function()
	SetSquadSupportWanderState(ConvertFactionToAffiliation(GetFelonyTypeID(selectedFaction)), 1)
	ScriptHook.ShowNotification("Seting Wander State: "..selectedFaction)
	end)
	
	menu:AddButton("Squad - Set Aware (Disable Wander)", "Squad means restricted area enemies", function()
	SetSquadSupportWanderState(ConvertFactionToAffiliation(GetFelonyTypeID(selectedFaction)), 0)
	ScriptHook.ShowNotification("Seting Aware State: "..selectedFaction)
	end)
	
	menu:AddButton("Squad - Force Vanish", "Squad means restricted area enemies", function()
	SquadForceVanish(ConvertFactionToAffiliation(GetFelonyTypeID(selectedFaction)), GetLocalPlayerEntityId())
	ScriptHook.ShowNotification("Forcing Vanish: "..selectedFaction)
	end)

	menu:OnUpdate(function()
		menu:SetEntryEnabled(searchButton, IsPoliceFactionSelected())
	end)
	
	return menu
end

-- God
function PlayerHasGod()
	return Script().StateWatcher:GetState("god") == true
end
function PlayerSetGod(on)
	local playerid = GetLocalPlayerEntityId()
	Script().StateWatcher:SetState("god", on)

	if on then
		ActivateInvincibility(playerid)
		SetPawnImmuneToDeath(playerid, 1)
	else
		RemoveInvincibility(playerid)
		SetPawnImmuneToDeath(playerid, 0)
	end
end

-- Unlimited Clip
function PlayerHasUnlimitedClip()
	return Script().StateWatcher:GetState("unlimitedClip") == true
end
function PlayerSetUnlimitedClip(on)
	Script().StateWatcher:SetState("unlimitedClip", on)
	Script().StateWatcher:UnlimitedClip()
end

-- Unlimited Ammo
function PlayerHasUnlimitedAmmo()
	return Globals.FREEROAM.Trainer_InfiniteAmmo
end
function PlayerSetUnlimitedAmmo(on)
	Globals.FREEROAM.Trainer_InfiniteAmmo = on
end

--Unlimited Battery
function PlayerHasUnlimitedBattery()
	return Globals.FREEROAM.Trainer_InfiniteBattery
end
function PlayerSetUnlimitedBattery(on)
	Globals.FREEROAM.Trainer_InfiniteBattery = on
end

-- Noclip
function ToggleNoclip()
	ScriptHook.SetLocalPlayerNoclip(not ScriptHook.HasLocalPlayerNoclip())
end

function OpenCashMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Cash Menu")
	
	local CashAdd1 = menu:AddButton("Add $1 cash", function()
		ScriptHook.SetProgression(0, 1)
		--ScriptHook.ShowNotification("Added $1 to your wallet")
	end)

	local CashAdd2 = menu:AddButton("Add $10 cash", function()
		ScriptHook.SetProgression(0, 10)
		--ScriptHook.ShowNotification("Added $10 to your wallet")
	end)
	
	local CashAdd3 = menu:AddButton("Add $100 cash", function()
		ScriptHook.SetProgression(0, 100)
		--ScriptHook.ShowNotification("Added $100 to your wallet")
	end)
	
	local CashAdd4 = menu:AddButton("Add $1000 cash", function()
		ScriptHook.SetProgression(0, 1000)
		--ScriptHook.ShowNotification("Added $1000 to your wallet")
	end)
	
	local CashAdd5 = menu:AddButton("Add $10000 cash", function()
		ScriptHook.SetProgression(0, 10000)
		--ScriptHook.ShowNotification("Added $10000 to your wallet")
	end)
	
	local CashAdd6 = menu:AddButton("Add $100000 cash", function()
		ScriptHook.SetProgression(0, 100000)
		--ScriptHook.ShowNotification("Added $100000 to your wallet")
	end)
	
	local CashAdd7 = menu:AddButton("Add $1000000 cash", function()
		ScriptHook.SetProgression(0, 1000000)
		--ScriptHook.ShowNotification("Added $1000000 to your wallet")
	end)
	
	local CashRemove1 = menu:AddButton("Remove $1 cash", function()
		ScriptHook.SetProgression(0, -1)
		--ScriptHook.ShowNotification("Removed $1 from your wallet")
	end)

	local CashRemove2 = menu:AddButton("Remove $10 cash", function()
		ScriptHook.SetProgression(0, -10)
		--ScriptHook.ShowNotification("Removed $10 from your wallet")
	end)
	
	local CashRemove3 = menu:AddButton("Remove $100 cash", function()
		ScriptHook.SetProgression(0, -100)
		--ScriptHook.ShowNotification("Removed $100 from your wallet")
	end)
	
	local CashRemove4 = menu:AddButton("Remove $1000 cash", function()
		ScriptHook.SetProgression(0, -1000)
		--ScriptHook.ShowNotification("Removed $1000 from your wallet")
	end)
	
	local CashRemove5 = menu:AddButton("Remove $10000 cash", function()
		ScriptHook.SetProgression(0, -10000)
		--ScriptHook.ShowNotification("Removed $10000 from your wallet")
	end)
	
	local CashRemove6 = menu:AddButton("Remove $100000 cash", function()
		ScriptHook.SetProgression(0, -100000)
		--ScriptHook.ShowNotification("Removed $100000 from your wallet")
	end)
	
	local CashRemove7 = menu:AddButton("Remove $1000000 cash", function()
		ScriptHook.SetProgression(0, -1000000)
		--ScriptHook.ShowNotification("Removed $1000000 from your wallet")
	end)

	return menu
end

function OpenFollowersMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Followers Menu")
	
	local Followers1 = menu:AddButton("Add 1 follower", function()
		ScriptHook.SetProgression(3, 1)
		ScriptHook.ShowNotification("Added 1 follower")
	end)

	local Followers2 = menu:AddButton("Add 10 followers", function()
		ScriptHook.SetProgression(3, 10)
		ScriptHook.ShowNotification("Added 10 followers")
	end)
	
	local Followers3 = menu:AddButton("Add 100 followers", function()
		ScriptHook.SetProgression(3, 100)
		ScriptHook.ShowNotification("Added 100 followers")
	end)
	
	local Followers4 = menu:AddButton("Add 1000 followers", function()
		ScriptHook.SetProgression(3, 1000)
		ScriptHook.ShowNotification("Added 1000 followers")
	end)
	
	local Followers5 = menu:AddButton("Add 10000 followers", function()
		ScriptHook.SetProgression(3, 10000)
		ScriptHook.ShowNotification("Added 10000 followers")
	end)
	
	local Followers6 = menu:AddButton("Add 100000 followers", function()
		ScriptHook.SetProgression(3, 100000)
		ScriptHook.ShowNotification("Added 100000 followers")
	end)
	
	local Followers7 = menu:AddButton("Add 1000000 followers", function()
		ScriptHook.SetProgression(3, 1000000)
		ScriptHook.ShowNotification("Added 1000000 followers")
	end)

	return menu
end

function AddKeyData(id)
	local playerID = GetLocalPlayerEntityId()
	local ComponentCount = tonumber(GetLocalPlayerResearchComponent(id))
	if ComponentCount == 0 then
	ExecuteReward_V2(playerID, id, 0)
	end
end

function OpenResearchMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Research Menu")
	
	local Research1 = menu:AddButton("Add 1 research point", function()
	local playerID = GetLocalPlayerEntityId()
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	end)

	local Research2 = menu:AddButton("Add 5 research points", function()
	local playerID = GetLocalPlayerEntityId()
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	end)
	
	local Research3 = menu:AddButton("Add 10 research points", function()
	local playerID = GetLocalPlayerEntityId()
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	end)
	
	local Research4 = menu:AddButton("Add 15 research points", function()
	local playerID = GetLocalPlayerEntityId()
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	end)
	
	local Research5 = menu:AddButton("Add 20 research points", function()
	local playerID = GetLocalPlayerEntityId()
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	ExecuteReward_V2(playerID, "Items.9223372048352280892", 1)
	end)
	
	local Research6 = menu:AddButton("Add all key data", "WARNING EXPERIMENTAL! USE TELEPORTS MENU!", function()
	local playerID = GetLocalPlayerEntityId()
	AddKeyData("Items.9223372048406406125")--Alcatraz
	AddKeyData("Items.9223372048406406142")--ATTPark
	AddKeyData("Items.9223372048406406127")--Chinatown
	AddKeyData("Items.9223372048406406139")--Cliff house
	AddKeyData("Items.9223372048406406136")--Coit Tower
	AddKeyData("Items.9223372048406406143")--Crystal Springs Dam
	AddKeyData("Items.9223372048406406133")--Elmhurst
	AddKeyData("Items.9223372048406406116")---Embarcadero Center
	AddKeyData("Items.9223372048406406132")---Ferry Building
	AddKeyData("Items.9223372048406406145")---Fort Point
	AddKeyData("Items.9223372048406406122")---Galilei
	AddKeyData("Items.9223372048406406120")---Herschel Observatory
	AddKeyData("Items.9223372048406406144")---Jack London Square
	AddKeyData("Items.9223372048406406117")---Kirby Cove
	AddKeyData("Items.9223372048406406128")---Lombard Street
	AddKeyData("Items.9223372048406406118")---MoMa
	--AddKeyData("Items.9223372048406406119")---New Dawn Chapel CUT
	--AddKeyData("Items.9223372051877399204")---North Beach CUT
	--AddKeyData("Items.9223372048030228009")---Nudle CUT
	--AddKeyData("Items.9223372048406406138")---Oakland City Hall CUT
	AddKeyData("Items.9223372048406406131")---Palo Alto
	AddKeyData("Items.9223372048406406141")---Prescott
	--AddKeyData("Items.9223372048406406123")---Shoreline Park CUT
	AddKeyData("Items.9223372048406406134")---Stanford University
	--AddKeyData("Items.9223372048406406137")---Superior Court CUT
	AddKeyData("Items.9223372048406406121")---Sutro Tower
	AddKeyData("Items.9223372048406406115")---The Gates Houseboat
	--AddKeyData("Items.9223372048406406140")---Transamerica Pyramid CUT
	AddKeyData("Items.9223372048406406124")---Vista Point
	AddKeyData("Items.9223372048406406126")---WideEarthDevelopmentFacility
	--AddKeyData("Items.9223372048406406135")---WKZ Station CUT
	AddKeyData("Items.9223372048406406129")---YerbaBuenaIsland
	ScriptHook.ShowNotification("All key data added")
	end)

	return menu
end

function OpenReputationMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Reputation Menu")
	
	local RepAdd = menu:AddButton("Add 10 positive points", function()
	AddReputationPoints(10, "Cheat")
	end)
	
	local RepDel = menu:AddButton("Add 10 negative points", function()
	AddReputationPoints(-10, "Cheat")
	end)
	
	local RepMaxGood = menu:AddButton("Set to maximum positive", "Sets to 'Sentinel' rank", function()
	SetItem("Items.12381395094839334792", 600)
	AddReputationPoints(50000, "Cheat")
	end)
	
	local RepGood = menu:AddButton("Set to positive", "Sets to 'Peacekeeper' rank", function()
	SetItem("Items.12381395094839334792", 600)
	AddReputationPoints(275, "Cheat")
	end)
	
	local RepNeutral = menu:AddButton("Set to neutral", "Sets to 'Incognito' rank", function()
	SetItem("Items.12381395094839334792", 600)
	DisplayReputationBar("REPUTATION: "..ReputationToString())
	end)
	
	local RepBad = menu:AddButton("Set to negative", "Sets to 'Disruptor' rank", function()
	SetItem("Items.12381395094839334792", 600)
	AddReputationPoints(-275, "Cheat")
	end)
	
	local RepMaxBad = menu:AddButton("Set to maximum negative", "Sets to 'Public Enemy' rank", function()
	SetItem("Items.12381395094839334792", 600)
	AddReputationPoints(-50000, "Cheat")
	end)

	return menu
end

-- Player
function PlayerMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Player")

	-- Items
	local godIdx = menu:AddCheckbox("God Mode", "Toggle invincibility", function()
		PlayerSetGod(not PlayerHasGod())
	end)
	
	local noclipIdx = menu:AddCheckbox("Noclip / Airbrake / Fly", "Enable/Disable flying", ToggleNoclip)

	local unlClipIdx = menu:AddCheckbox("Unlimited Bullets", "Shoot infinitely, no reloading", function()
		PlayerSetUnlimitedClip(not PlayerHasUnlimitedClip())
	end)
	
	local unlAmmoIdx = menu:AddCheckbox("Unlimited Ammo", "Unlimited ammunition, still need to reload", function()
		PlayerSetUnlimitedAmmo(not PlayerHasUnlimitedAmmo())
	end)
	
	menu:AddButton("Full Ammo", "Instantly refill ammunition",  function()
		ExecuteReward_V2(GetLocalPlayerEntityId(), "Items.9223372048779332208", 0)
		ScriptHook.ShowNotification("Ammo refilled")
	end)
	
	menu:AddButton("No Ammo", "Removes all ammo",  function()
		RemoveItem("Items.9223372048779332213", 9999) --Pistol
		RemoveItem("Items.9223372048779332217", 9999) --SMG
		RemoveItem("Items.9223372048779332204", 9999) --Shotgun
		RemoveItem("Items.9223372048779332200", 9999) --AR Bullet
		RemoveItem("Items.9223372048779332221", 9999) --Sniper Bullet
		RemoveItem("Items.9223372048779332209", 9999) --Grenade Bullet
		RemoveItem("Items.9223372066571805543", 9999) --Grenade M32 Bullet
		ScriptHook.ShowNotification("Ammo removed")
	end)
	
	local unlBatteryIdx = menu:AddCheckbox("Unlimited Battery", "Infinite botnets, hack forever without stopping", function()
		PlayerSetUnlimitedBattery(not PlayerHasUnlimitedBattery())
	end)
	
	menu:AddButton("Recharge Battery", "Instantly refill botnets", function()
		ExecuteReward_V2(GetLocalPlayerEntityId(), "Items.13654314691341285506", 0)
		ScriptHook.ShowNotification("Botnet recharged")
	end)
	
	menu:AddButton("Add Health Boost", "WD2E: Adds health boost from drinking",  function()
		Globals.FREEROAM.RegenState = 1
		AddPerkWithDbObjToPlayer("PerksSinglePlayer.12806287266255240276")
		ExecuteReward_V2(GetLocalPlayerEntityId(), "Items.11905948399914855160", 1)
		StartPostFxOnPlayer(GetLocalPlayerEntityId(), "adrenaline_loop", self, "Event_Played")
		CDominoSoundManager_GetInstance():PlaySound("18446744073709551615", "soundbinary/4289999995.bnk", self, "Callback_Sound")
	end)
	
	
	menu:AddButton("Felony", "Set or clear wanted level", OpenWantedMenuCall)
	menu:AddButton("Relationships", "Set player relationship with other factions", OpenRelationshipMenu)
	menu:AddButton("Cash Menu", "Add or remove cash", OpenCashMenu)
	menu:AddButton("Followers Menu", "Add followers", OpenFollowersMenu)
	menu:AddButton("Research Menu", "Add research points", OpenResearchMenu)
	menu:AddButton("Reputation Menu", "Change reputation levels", OpenReputationMenu)

	-- Update
	menu:OnUpdate(function()
		menu:SetChecked(godIdx, PlayerHasGod())
		menu:SetChecked(unlClipIdx, PlayerHasUnlimitedClip())
		menu:SetChecked(unlAmmoIdx, PlayerHasUnlimitedAmmo())
		menu:SetChecked(unlBatteryIdx, PlayerHasUnlimitedBattery())

		menu:SetChecked(noclipIdx, ScriptHook.HasLocalPlayerNoclip())
		menu:SetEntryEnabled(noclipIdx, not ScriptHook.HasLocalPlayerFreeCamera())
	end)

	return menu
end

table.insert(SimpleTrainerMenuItems, { "Player", "Toggle god mode, control felony, etc.", Script():CacheMenu(PlayerMenu) })