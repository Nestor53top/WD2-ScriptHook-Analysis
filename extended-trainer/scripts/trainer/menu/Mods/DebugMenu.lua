--This is an example extension that adds Debug menu to the trainer

local function AbortMissionCall()
	AbortMission_v2("MissionList.0")
	MissionEnded()
end

local function GameOverCall()
	GameOver(1)
end

local function ForceInteract()
	local Entity = GetReticleHitEntity()
	if Entity ~= nil then
	ScriptHook.ShowNotification("Forced interaction on target entity")
	UseSelectedIngredient(GetLocalPlayerEntityId(), Entity)
	else
	ScriptHook.ShowNotification("Target entity not found")
	end
end

local function ForceInteractComplete()
	local Entity = GetReticleHitEntity()
	if Entity ~= nil then
	ScriptHook.ShowNotification("Forced interaction completion on target entity")
	ForceCompleteInteraction(Entity)
	else
	ScriptHook.ShowNotification("Target entity not found")
	end
end

local function ForceHack()
	local Entity = GetReticleHitEntity()
	if Entity ~= nil then
	ScriptHook.ShowNotification("Forced hack on target entity")
	ForceHackIngredient(Entity, GetLocalPlayerEntityId())
	else
	ScriptHook.ShowNotification("Target entity not found")
	end
end

local function GameMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Debug")
	
	menu:AddButton("Dump Position", "Dump info to scripthook_position.txt", function()
		local lplayer = GetLocalPlayerEntityId()
		local PosX, PosY, PosZ = tostring(GetEntityPosition(lplayer, 0)), tostring(GetEntityPosition(lplayer, 1)), tostring(GetEntityPosition(lplayer, 2))
		file = io.open("scripthook_position.txt", "w")
		file:write(PosX..", "..PosY..", "..PosZ)
		file:close()
		ScriptHook.ShowNotification("Saved to scripthook_position.txt: \n"..PosX..", "..PosY..", "..PosZ)
	end)
	
	menu:AddButton("Dump Position + Angle", "Dump info to scripthook_position.txt", function()
		local lplayer = GetLocalPlayerEntityId()
		local PosX, PosY, PosZ = tostring(GetEntityPosition(lplayer, 0)), tostring(GetEntityPosition(lplayer, 1)), tostring(GetEntityPosition(lplayer, 2))
		local Angle = tostring(GetEntityAngle(lplayer, 2))
		file = io.open("scripthook_position.txt", "w")
		file:write(PosX..", "..PosY..", "..PosZ..", "..Angle)
		file:close()
		ScriptHook.ShowNotification("Saved to scripthook_position.txt: \n"..PosX..", "..PosY..", "..PosZ..", "..Angle)
	end)

	-- Items
	menu:AddButton("Trigger Game Over", "Reloads last autosave with intro animation", GameOverCall)
	menu:AddButton("Force Interact", "Forces interaction on aimed entity", ForceInteract)
	menu:AddButton("Force Interact Complete", "Forces interaction completion on aimed entity", ForceInteractComplete)
	menu:AddButton("Force Hack", "Forces hack on aimed entity", ForceHack)
	menu:AddButton("Abort Mission", "WARNING: Might break things", AbortMissionCall)
	menu:AddButton("Manual Save", "Press to save the game", function() 
		SaveTheGame() 
		ScriptHook.ShowNotification("Game saved") 
	end)
	return menu
end

table.insert(SimpleTrainerMenuItems, { "Debug", "Example Addon: Debug and dev functions", Script():CacheMenu(GameMenu) })