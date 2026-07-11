--Original Scripthook Commands

-- setCamera <pX> <pY> <pZ> <rX> <rY> <rZ>
local function command_set_camera(pX, pY, pZ, rX, rY, rZ)
	ScriptHook.CameraSetCustom(pX, pY, pZ, rX, rY, rZ)
	print("Successfully set camera to "..pX..", "..pY..", "..pZ.."("..rX..", "..rY..", "..rZ)
end

-- resetCamera
local function command_reset_camera()
	ScriptHook.CameraReset()
	print("Successfully reset camera")
end

-- Register command set camera
local cmd_set_camera = ScriptHook.RegisterCommand("setCamera", command_set_camera)
cmd_set_camera:AddArgument("pX", true, CommandArgumentType.Float)
cmd_set_camera:AddArgument("pY", true, CommandArgumentType.Float)
cmd_set_camera:AddArgument("pZ", true, CommandArgumentType.Float)
cmd_set_camera:AddArgument("rX", true, CommandArgumentType.Float)
cmd_set_camera:AddArgument("rY", true, CommandArgumentType.Float)
cmd_set_camera:AddArgument("rZ", true, CommandArgumentType.Float)
cmd_set_camera:SetDescription("Set custom camera on position and rotation (pX, pY, pZ, rX, rY, rZ)")

-- Register command reset camera
local cmd_reset_camera = ScriptHook.RegisterCommand("resetCamera", command_reset_camera)
cmd_reset_camera:SetDescription("Reset the camera behind the player")

-- cash <value>
local function command_setcash(val)
    local gave_amount = ScriptHook.SetProgression(0, tonumber(val))
    print("Successfully gave $"..gave_amount)
end

-- Register command
local cmd_teleport = ScriptHook.RegisterCommand("cash", command_setcash)
cmd_teleport:AddArgument("value", false, CommandArgumentType.UInt32)
cmd_teleport:SetDescription("Adds the cash in your pocket")

-- god [on/off]
local function command_god(val)
	local playerid = GetLocalPlayerEntityId()
	if playerid == GetInvalidEntityId() then
		print("Cannot god at this time")
		return
	end

	local stateWatcher = Script().StateWatcher

	if val == nil or val == "on" or val == "true" or val == "1" then
		ActivateInvincibility(playerid)
		SetPawnImmuneToDeath(playerid, 1)
		stateWatcher:SetState("god", true)
		print("God mode enabled")
	else
		RemoveInvincibility(playerid)
		SetPawnImmuneToDeath(playerid, 0)
		stateWatcher:SetState("god", false)
		print("God mode disabled")
	end
end

-- Register command
local cmd_god = ScriptHook.RegisterCommand("god", command_god)
cmd_god:AddArgument("on/off", true)
cmd_god:SetDescription("Enable/Disable god mode")

local cmd_god2 = ScriptHook.RegisterCommand("player_invincible", command_god)
cmd_god2:AddArgument("on/off", true)
cmd_god2:SetDescription("Enable/Disable god mode")

-- hud
local function command_toggle_hud(val)
	if val == nil or val == "on" or val == "true" or val == "1"  then
		SendShowOrHideAllUIEvent(1)
		print("Successfully enabled HUD")
	else
		SendShowOrHideAllUIEvent(0)
		print("Successfully disabled HUD")
	end
end

-- Register command toggle hud
local cmd_hud = ScriptHook.RegisterCommand("hud", command_toggle_hud)
cmd_hud:AddArgument("on/off", true)
cmd_hud:SetDescription("Enable/Disable HUD")

-- progression <id> <value>
local function command_setprogression(id, val)
    ScriptHook.SetProgression(tonumber(id), tonumber(val))
    print("Successfully set progression $"..id.." to value $"..val)
end

-- Register command
local cmd_teleport = ScriptHook.RegisterCommand("progression", command_setprogression)
cmd_teleport:AddArgument("id", false, CommandArgumentType.UInt32)
cmd_teleport:AddArgument("value", false, CommandArgumentType.UInt32)
cmd_teleport:SetDescription("Sets the player progression to a specific value")

-- repairVehicle
local function command_repairlocalplayervehicle()
	local plyId = GetLocalPlayerEntityId()
	local vehId = GetCurrentVehicleEntityId(plyId) 

	ScriptHook.RepairVehicle(vehId)
end

-- Register command
local cmd_teleport = ScriptHook.RegisterCommand("repairVehicle", command_repairlocalplayervehicle)
cmd_teleport:SetDescription("Repairs the vehicle you are sitting in")

-- skin <model>
local function command_changeskin(model)
	local playerid = GetLocalPlayerEntityId()
	if playerid == GetInvalidEntityId() then
		print("Cannot change your skin at this time")
		return
	end
	ChangeGraphicKitModel(playerid, model)
	print("Skin successfully changed!")
end

-- Register command
local cmd_teleport = ScriptHook.RegisterCommand("skin", command_changeskin)
cmd_teleport:AddArgument("model", false)
cmd_teleport:SetDescription("Change your skin (graphckitmodel name)")

-- spawn <name OR archetype>
local function command_spawn(query)
	if query == nil or string.len(query) <= 1 then
		print("Syntax: spawn <name OR archetype>")
		print("For a list of names and archetypes, check out data/scripts/trainer/Vehicles.txt")
		
		return
	end
	
	local archetype = nil
	if string.sub(query, 1, 1) == '{' then
		if string.len(query) ~= 38 then
			print("Invalid archetype")
			return
		end
	else
		archetype = VehicleArchetype[query]
		if archetype == nil then
			-- Lowercase compare
			query = string.lower(query)

			for k,v in pairs(VehicleArchetype) do
				if string.lower(k) == query then
					archetype = v
					break
				end
			end
		end
	end
	
	if archetype == nil then
		print("Invalid vehicle " .. query)
		print("For a list of names and archetypes, check out data/scripts/trainer/Vehicles.txt")
	
		return
	end
	
	local pos = GetReticleHitLocation()
	local veh = SpawnEntityFromArchetype(archetype, pos[1], pos[2], pos[3], 0, 0, 0)
	if veh == GetInvalidEntityId() then
		print("Failed to spawn vehicle!")
		return
	end
	
	SetVehicleLockState(veh, 1)
	print("Spawned " .. query .. " (Id: " .. veh .. ")")
end

-- Register command
local cmd_spawn = ScriptHook.RegisterCommand("spawn", command_spawn)
cmd_spawn:AddArgument("name OR archetype", false)
cmd_spawn:SetDescription("Spawn a vehicle (by name or archetype)")

-- teleport <x> <y> <z>
local function command_teleport(x, y, z)
	local lplayer = GetLocalPlayerEntityId()
	if playerid == GetInvalidEntityId() then
		print("Cannot teleport at this time")
		return
	end
	
	ScriptHook.Teleport(x, y, z)
	print("Successfully teleported to "..x..", "..y..", "..z)
end

-- Register command
local cmd_teleport = ScriptHook.RegisterCommand("teleport", command_teleport)
cmd_teleport:AddArgument("x", true, CommandArgumentType.Float)
cmd_teleport:AddArgument("y", true, CommandArgumentType.Float)
cmd_teleport:AddArgument("z", true, CommandArgumentType.Float)
cmd_teleport:SetDescription("Teleport to coordinates (x, y, z)")

-- time <hour> <minute>
local function command_changetimeofday(hour, minute)
	if hour and minute then
		SetTimeOfDayHourAndMinute(tonumber(hour), tonumber(minute))
		print("Successfully changed time of day to "..hour..":"..minute)
	end
end

-- Register command
local cmd_time = ScriptHook.RegisterCommand("time", command_changetimeofday)
cmd_time:AddArgument("hour", false)
cmd_time:AddArgument("minute", false)
cmd_time:SetDescription("Change the time of day")

local function command_changehour(hour)
	if hour then
		SetTimeOfDayHourAndMinute(tonumber(hour), GetTimeOfDayMinute())
	end
end

local cmd_hour = ScriptHook.RegisterCommand("env_hour", command_changehour)
cmd_hour:AddArgument("hour", false)
cmd_hour:SetDescription("Set hour")

-- timescale <scale>
local function command_settimescale(scale)
	SetTimeScale(scale)
	print("Successfully changed timescale to "..scale)
end

-- Register command
local cmd_teleport = ScriptHook.RegisterCommand("timescale", command_settimescale)
cmd_teleport:AddArgument("scale", false, CommandArgumentType.Float)
cmd_teleport:SetDescription("Change the timescale (default 1.0)")

-- weather <id>
local function command_setweather(id)
	local weather = WeatherIDs[id]
	if weather then
		PushEnvironmentWeatherOverride(weather, 1)
		print("Successfully changed weather to "..weather.." (#"..id..")")
	else
		print("Failed to find the given weather")
	end
end

-- Register command
local cmd_teleport = ScriptHook.RegisterCommand("weather", command_setweather)
cmd_teleport:AddArgument("id", false)
cmd_teleport:SetDescription("Change the world weather (e.g. SanFran.Clear.Clear_1)")

--NEW COMMANDS

local function command_getpos()
		local lplayer = GetLocalPlayerEntityId()
		local PosX, PosY, PosZ = tostring(GetEntityPosition(lplayer, 0)), tostring(GetEntityPosition(lplayer, 1)), tostring(GetEntityPosition(lplayer, 2))
		file = io.open("scripthook_position.txt", "w")
		file:write(PosX..", "..PosY..", "..PosZ)
		file:close()
		ScriptHook.ShowNotification("Saved to scripthook_position.txt: \n"..PosX..", "..PosY..", "..PosZ)
end

local cmd_getpos = ScriptHook.RegisterCommand("getpos", command_getpos)
cmd_getpos:SetDescription("Gets current player position and dumps it to scripthook_position.txt in game folder")

local function command_getposangle()
		local lplayer = GetLocalPlayerEntityId()
		local PosX, PosY, PosZ = tostring(GetEntityPosition(lplayer, 0)), tostring(GetEntityPosition(lplayer, 1)), tostring(GetEntityPosition(lplayer, 2))
		local Angle = tostring(GetEntityAngle(lplayer, 2))
		file = io.open("scripthook_position.txt", "w")
		file:write(PosX..", "..PosY..", "..PosZ..", "..Angle)
		file:close()
		ScriptHook.ShowNotification("Saved to scripthook_position.txt: \n"..PosX..", "..PosY..", "..PosZ)
end

local cmd_getposangle = ScriptHook.RegisterCommand("getposangle", command_getposangle)
cmd_getposangle:SetDescription("Gets current player position (with Z rotation) and dumps it to scripthook_position.txt in game folder")

local function command_felonykill()
    target = GetLocalPlayerEntityId()
	FelonyEndChaseOrSearch(target, 0, 1)
	FelonyEndChaseOrSearch(target, 1, 1)
	FelonyEndChaseOrSearch(target, 3, 1)
	FelonyEndChaseOrSearch(target, 6, 1)
	FelonyEndChaseOrSearch(target, 9, 1)
	FelonyEndChaseOrSearch(target, 10, 1)
	FelonyEndChaseOrSearch(target, 11, 1)
	FelonyEndChaseOrSearch(target, 12, 1)
	FelonyEndChaseOrSearch(target, 15, 1)
	SquadForceVanish(1, target)
	SquadForceVanish(2, target)
	SquadForceVanish(3, target)
	SquadForceVanish(4, target)
	SquadForceVanish(5, target)
	SquadForceVanish(8, target)
	SquadForceVanish(9, target)
	SquadForceVanish(11, target)
	SquadForceVanish(12, target)
	SquadForceVanish(13, target)
	SquadForceVanish(14, target)
	SquadForceVanish(17, target)
end
local cmd_felonykill = ScriptHook.RegisterCommand("felonykill", command_felonykill)
cmd_felonykill:SetDescription("Clears all wanted level (Felony/Squad)")

local function command_suicide()
	SendDamageToEntity(GetLocalPlayerEntityId(), "", 16, 1000, 1)
end
local cmd_suicide = ScriptHook.RegisterCommand("suicide", command_suicide)
cmd_suicide:SetDescription("Kills the player")

local function command_gameover()
	GameOver(GetLocalPlayerId())
end
local cmd_gameover = ScriptHook.RegisterCommand("trigger_initial_spawn", command_gameover)
cmd_gameover:SetDescription("Reloads the world")

local function command_arrest()
	Globals.FREEROAM.Busted = 1
	GameOver(GetLocalPlayerId())
end
local cmd_arrest = ScriptHook.RegisterCommand("arrest", command_arrest)
cmd_arrest:SetDescription("WD2E: Forces the player to respawn at police station")