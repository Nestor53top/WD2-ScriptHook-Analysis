local ctOSMalfunction = false
local LifeScoreProfiler = false

DynamicEventsList = {
    {
        name = "DedSec Events",
        desc = "Guaranteed to work",
        events = {
            {"Hack The Hacker", "9223372043199907303"},
            {"The Hunt", "9223372052687269930"},
            {"Loot Truck", "9223372076342144751"},
            {"Persecution - FBI", "9223372052687269927"},
            {"Persecution - Prime Eight", "9223372052687269928"},
            {"Virus", "9223372046494180150"},
        }
    },
    {
        name = "Emergent Events - Crime",
        desc = "May not work",
        events = {
			{"Armedrobber-Discrete-FvF", "9223372048235056075"},
			{"Armedrobber-Discrete-FvM", "9223372048235056074"},
			{"Armedrobber-Discrete-MvF-v2", "9223372051242349802"},
			{"Armedrobber-Discrete-MvF", "9223372048235056073"},
			{"Armedrobber-Discrete-MvM", "9223372048110639628"},
			{"ArmedRobber-Flee-FvM", "9223372047858451825"},
			{"ArmedRobber-Flee-MvF", "9223372047858451824"},
			{"ArmedRobber-Flee-MvM", "9223372047858451817"},
			{"ArmedRobber-Revenge-FvF", "9223372047858451826"},
			{"ArmedRobber-Revenge-MvM", "9223372047858451818"},
			{"ArmedRobber-Takedown01-FvF", "9223372047858451827"},
			{"ArmedRobber-Takedown01-FvF_V2", "9223372051624599525"},
			{"ArmedRobber-Takedown01-FvF_V3", "9223372051624599526"},
			{"ArmedRobber-Takedown01-FvF_V4", "9223372051624599527"},
			{"ArmedRobber-Takedown01-MvF", "9223372047858451819"},
			{"ArmedRobber-Takedown01-MvF_V2", "9223372051624599528"},
			{"ArmedRobber-Takedown01-MvF_V3", "9223372051624599529"},
			{"ArmedRobber-Takedown01-MvF_V4", "9223372051624599530"},
			{"ArmedRobber-Takedown01-MvM", "9223372051624599531"},
			{"ArmedRobber-Takedown01-MvM_V2", "9223372051624599532"},
			{"ArmedRobber-Takedown01-MvM_V3", "9223372051624599533"},
			{"ArmedRobber-Takedown01-MvM_V4", "9223372051624599534"},
			{"ArmedRobber-Takedown02-FvM", "9223372051624599535"},
			{"ArmedRobber-Takedown02-FvM_V2", "9223372051624599536"},
			{"ArmedRobber-Takedown02-FvM_V3", "9223372051624599537"},
			{"ArmedRobber-Takedown02-MvF", "9223372047858451828"},
			{"ArmedRobber-Takedown02-MvM", "9223372047858451820"},
			{"Car-Thief", "9223372053273390826"},
			{"CellPhoneRobber-Discrete-Fail-MvM", "9223372048234975594"},
			{"CellPhoneRobber-Fail-MvF", "9223372047858451821"},
			{"Drive-And-Shoot_Bike", "9223372048395083195"},
			{"Drive-And-Shoot_Car", "6A4F839C02000080"},
        }
    },
    {
        name = "Emergent Events - Misc",
        desc = "May work",
        events = {
			{"Car_Crusher.Car_Crusher_Event", "9223372044010867347"},
			{"Car-Crusher-CLO.Car-Crusher-CLO-FemaleOnly", "9223372055153889627"},
			{"Car-Crusher-CLO.Car-Crusher-CLO-MaleOnly", "9223372055153889626"},
			{"Conflict-Punch-FvM", "9223372048017337435"},
			{"Conflict-Punch-MvM", "9223372048017337434"},
			{"Conflict-Slap-FvF", "9223372048293078181"},
			{"Conflict-Slap-MvM", "9223372048293078180"},
			{"Greeting-01-MvM-Contact", "9223372052003264297"},
			{"Greeting-01-MvM", "9223372048110445729"},
			{"Greeting-02-MvM-Contact", "9223372051242349787"},
			{"Greeting-02-MvM", "9223372048110445730"},
			{"Greeting-03-MvM-Contact", "9223372051624664045"},
			{"Greeting-03-MvM", "9223372048110445731"},
			{"Greeting-04-MvM-Contact", "9223372051242349788"},
			{"Greeting-04-MvM", "9223372048110445732"},
			{"Greeting-05-FvF-Contact", "9223372051242349789"},
			{"Greeting-05-FvF", "9223372048110445733"},
			{"Greeting-06-FvF-Contact", "9223372052003264294"},
			{"Greeting-06-FvF", "9223372048499225159"},
			{"Greeting-07-FvF-Contact", "9223372051242349790"},
			{"Greeting-07-FvF", "9223372048552270021"},
			{"Greeting-08-MvF-Contact", "9223372051242349791"},
			{"Greeting-08-MvF", "9223372051242349794"},
			{"Greeting-09-MvF-Contact", "9223372051242349792"},
			{"Greeting-09-MvF", "9223372048604089323"},
			{"Hobo-Fight-Bottle-MvM", "9223372048070561635"},
			{"Hobo-Fight-Zone-MvM", "9223372048453916388"},
			{"Prank-Cracker-MvF", "9223372048293117481"},
			{"Prank-Cracker-MvM", "9223372048017255614"},
        }
    },
}

-- Environment.Time
function TimeMenu()
	local menu = UI.SimpleMenu()

	-- Title Update
	menu:OnUpdate(function()
		menu:SetTitle("Time (" .. string.format("%02d:%02d", GetTimeOfDayHour(), GetTimeOfDayMinute()) .. ")")
	end)

	-- Menu 
	menu:AddButton("+1h", "+1 Hour", function()
		SetTimeOfDayHourAndMinute(GetTimeOfDayHour() + 1, GetTimeOfDayMinute())
	end)
	menu:AddButton("-1h", "-1 Hour", function()
		SetTimeOfDayHourAndMinute(GetTimeOfDayHour() - 1, GetTimeOfDayMinute())
	end)
	
	menu:AddButton("+1m", "+1 Minute", function()
		SetTimeOfDayHourAndMinute(GetTimeOfDayHour(), GetTimeOfDayMinute() + 1)
	end)
	menu:AddButton("-1m", "-1 Minute, buggy when hour skips", function()
		SetTimeOfDayHourAndMinute(GetTimeOfDayHour(), GetTimeOfDayMinute() - 1)
	end)
	
	menu:AddButton("Preset: 8:00", "Sunrise", function()
		SetTimeOfDayHourAndMinute(8, 0)
	end)
	
	menu:AddButton("Preset: 12:00", "Daytime", function()
		SetTimeOfDayHourAndMinute(12, 0)
	end)
	
	menu:AddButton("Preset: 17:00", "Sunset", function()
		SetTimeOfDayHourAndMinute(17, 0)
	end)
	
	menu:AddButton("Preset: 23:00", "Night", function()
		SetTimeOfDayHourAndMinute(23, 0)
	end)

	return menu
end

timescale = 1.0
function TimeScaleMenu()
	local menu = UI.SimpleMenu()

	-- Title Update
	menu:OnUpdate(function()
		menu:SetTitle("TimeScale " .. timescale)
	end)

	-- Menu 
	menu:AddButton("+15.0x", function()
		timescale = timescale + 15.0
		SetTimeScale(timescale)
	end)
	menu:AddButton("-15.0x", function(menu, text, hint, index)
		timescale = timescale - 15.0

		if (timescale < 0.0) then
			timescale = 0.0
		end

		SetTimeScale(timescale)
	end)
	menu:AddButton("0.0", "Freeze time", function()
		timescale = 0.0
		SetTimeScale(timescale)
	end)
	menu:AddButton("Reset", function()
		timescale = 1
		SetTimeScale(timescale)
	end)

	return menu
end

function BooleanToString(value, translated)
	if value == true then
		if translated == true then
			return "On"
		end

		if translated == false then
			return "True"
		end
	end

	if value == false then
		if translated == true then
			return "Off"
		end

		if translated == false then
			return "False"
		end
	end
end

function SpawnerMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("World Spawner")
	
	-- Menu 
	local toggleSpawnerButton = menu:AddButton("Toggle World Spawner", "Toggle if traffic is spawned or not", function()
		ScriptHook.ToggleWorldSpawner()
		ScriptHook.ShowNotification("World spawner is now " .. BooleanToString(ScriptHook.IsWorldSpawnerEnabled(), true))
	end)

	local toggleImpostorButton = menu:AddButton("Toggle World Impostor", "Toggle if far away traffic is spawned or not", function()
		ScriptHook.ToggleWorldImpostor()
		ScriptHook.ShowNotification("World impostor is now " .. BooleanToString(ScriptHook.IsWorldImpostorEnabled(), true))
	end)

	menu:OnUpdate(function()
		local isSpawnerOn = ScriptHook.IsWorldSpawnerEnabled()
		local isImpostorOn = ScriptHook.IsWorldImpostorEnabled()
		
		menu:SetEntryText(toggleSpawnerButton, "Toggle World Spawner [" .. string.format("%s", BooleanToString(isSpawnerOn, true)) .. "]")
		menu:SetEntryText(toggleImpostorButton, "Toggle World Impostor [" .. string.format("%s", BooleanToString(isImpostorOn, true)) .. "]")
	end)

	return menu
end

-- Environment.Weather
function SetWeather(menu, text, name)
	PushEnvironmentWeatherOverride(WeatherIDs[name], 1)
end

function WeatherMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Weather")
	
	for k,v in pairsByKeys(WeatherIDs) do
		menu:AddButton(k:sub(9), k, SetWeather)
	end

	return menu
end

function PlayBroadCast(menu, text, name)
	ScriptHook.PlayBroadcast(Broadcasts[name])
	ScriptHook.ShowNotification("Playing broadcast " .. name)
end

function MediaBroadcast()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Media Broadcast")

	menu:AddButton("Reset the default", "Resets the world broadcast to default", function()
		ScriptHook.ResetBroadcastToDefault()
		ScriptHook.ShowNotification("Reset the world broadcast to default")
	end)
	
	for k,v in pairsByKeys(Broadcasts) do
		menu:AddButton(k:sub(9), k, PlayBroadCast)
	end

	return menu
end

function CloneEntity()
	local entityId = GetReticleHitEntity()
	print("EntityId " .. entityId)
	if entityId == GetInvalidEntityId() then
		ScriptHook.ShowNotification("Cannot find an entity on the spot")
		return
	end

	local xPos = GetEntityPosition(entityId, 0)
    local yPos = GetEntityPosition(entityId, 1)
	local zPos = GetEntityPosition(entityId, 2)
	
	xPos = xPos + 5

    --self.xRot = GetEntityAngle(self.Entity, 0)
	--self.yRot = GetEntityAngle(self.Entity, 1)
	--self.zRot = GetEntityAngle(self.Entity, 2)
	
	local archetypeHash = ScriptHook.GetArchetypeHashByEntityId(entityId)
	local graphicKitHidKey = ScriptHook.GetGraphicKitModelByEntityId(entityId)

	print("ArchetypeHash " .. archetypeHash)
	print("GraphicKitHidKey " .. graphicKitHidKey)

	local entity = ScriptHook.SpawnEntityFromArchetypeHash(archetypeHash, xPos, yPos, zPos)
	if entity == GetInvalidEntityId() then
		ScriptHook.ShowNotification("Failed to spawn entity")
		return
	end

	if graphicKitHidKey ~= GetInvalidEntityId() then
		ScriptHook.SetEntityGraphicKitModel(entity, graphicKitHidKey)
	end
	
	ScriptHook.ShowNotification("Spawned entity")
end


PowerGlitchSettings = {
	["IsActive"] = false,
	["LowFrequency"] = 6,
	["HighFrequency"] = 15,
	["Intensity"] = 0.5,
	["BlockSize"] = 100,
	["FadeTime"] = 2
}

BlackoutSettings = {
	["IsActive"] = false,
	["Instigator"] = nil,
	["Origin"] = nil,
	["PropagationSpeed"] = 100,
	["RecoverySpeed"] = 100,
	["Radius"] = 100,
	["Special"] = 0,
	["Duration"] = 10,
	["OnlyAffectsLighting"] = false	
}

function AdjustIntegerValue(settingsTable, adjustIntegerMenuTitle, adjustIntegerMenuSetting)
	local menu = UI.SimpleMenu()
	menu:SetTitle(adjustIntegerMenuTitle)

	menu:AddButton("Increase", "Increases the value by 1", function()
		settingsTable[adjustIntegerMenuSetting] = settingsTable[adjustIntegerMenuSetting] + 1
	end)

	menu:AddButton("Decrease", "Decreases the value by 1", function()
		settingsTable[adjustIntegerMenuSetting] = settingsTable[adjustIntegerMenuSetting] - 1
		
		if settingsTable[adjustIntegerMenuSetting] < 0 then
			settingsTable[adjustIntegerMenuSetting] = 0
		end
	end)

	menu:OnUpdate(function()
		menu:SetTitle(adjustIntegerMenuTitle .. " " .. string.format("%d", settingsTable[adjustIntegerMenuSetting]))
	end)

	return menu
end

function AdjustFloatValue(settingsTable, adjustFloatMenuTitle, adjustFloatMenuSetting)
	local menu = UI.SimpleMenu()
	menu:SetTitle(adjustFloatMenuTitle)

	menu:AddButton("Increase", "Increases the value by 0.1", function()
		settingsTable[adjustFloatMenuSetting] = settingsTable[adjustFloatMenuSetting] + 0.1
	end)

	menu:AddButton("Decrease", "Decreases the value by 0.1", function()
		settingsTable[adjustFloatMenuSetting] = settingsTable[adjustFloatMenuSetting] - 0.1
		
		if settingsTable[adjustFloatMenuSetting] < 0.0 then
			settingsTable[adjustFloatMenuSetting] = 0.0
		end
	end)

	menu:OnUpdate(function()
		menu:SetTitle(adjustFloatMenuTitle .. " " .. string.format("%.1f", settingsTable[adjustFloatMenuSetting]))
	end)

	return menu
end

function AdjustBooleanValue(settingsTable, adjustFloatMenuTitle, adjustFloatMenuSetting)
	local menu = UI.SimpleMenu()
	menu:SetTitle(adjustFloatMenuTitle)

	local enableButton = menu:AddButton("True (On)", "Sets the value to true", function()
		settingsTable[adjustFloatMenuSetting] = true
	end)

	local disableButton = menu:AddButton("False (Off)", "Sets the value to false", function()
		settingsTable[adjustFloatMenuSetting] = false
	end)

	menu:OnUpdate(function()
		menu:SetTitle(adjustFloatMenuTitle .. " " .. string.format("%s", BooleanToString(settingsTable[adjustFloatMenuSetting], true)))

		if settingsTable[adjustFloatMenuSetting] == true then
			menu:SetEntryEnabled(enableButton, false)
			menu:SetEntryEnabled(disableButton, true)
		end

		if settingsTable[adjustFloatMenuSetting] == false then
			menu:SetEntryEnabled(enableButton, true)
			menu:SetEntryEnabled(disableButton, false)
		end
	end)

	return menu
end

function PowerGlitchMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Power Glitch")

	local resetButton = menu:AddButton("Reset", "Resets and stops the power glitch", function()
		PowerGlitchSettings["IsActive"] = false

		ScriptHook.ShowNotification("Power glitch stopped, energy network is recovering")
		StopGlobalPowerGlitch()
	end)

	local startButton = menu:AddButton("Start with parameters", "Starts the power glitch", function()
		PowerGlitchSettings["IsActive"] = true

		ScriptHook.ShowNotification("Power glitch initiated")
		StartGlobalPowerGlitch(
			PowerGlitchSettings["LowFrequency"], 
			PowerGlitchSettings["HighFrequency"], 
			PowerGlitchSettings["Intensity"],
			PowerGlitchSettings["BlockSize"],
			PowerGlitchSettings["FadeTime"])
	end)

	local lowFreqButton = menu:AddButton("Low Frequency", "Adjust the low frequency", Script():CacheMenu(function()
		return AdjustIntegerValue(PowerGlitchSettings, "Low Frequency", "LowFrequency")
	end))

	local highFreqButton = menu:AddButton("High Frequency", "Adjust the high frequency", Script():CacheMenu(function()
		return AdjustIntegerValue(PowerGlitchSettings, "High Frequency", "HighFrequency")
	end))

	local intensityButton = menu:AddButton("Intensity", "Adjust the intensity", Script():CacheMenu(function()
		return AdjustFloatValue(PowerGlitchSettings, "Glitch Intensity", "Intensity")
	end))

	local blockSizeButton = menu:AddButton("Block Size", "Adjust the block size", Script():CacheMenu(function()
		return AdjustIntegerValue(PowerGlitchSettings, "Block Size", "BlockSize")
	end))

	local fadeTimeButton = menu:AddButton("Fade Time", "Adjust the fade time", Script():CacheMenu(function()
		return AdjustIntegerValue(PowerGlitchSettings, "Fade Time", "FadeTime")
	end))

	function IsPowerGlitchActive()
		return PowerGlitchSettings["IsActive"]
	end

	menu:OnUpdate(function()
		menu:SetEntryText(lowFreqButton, "Low Frequency [" .. string.format("%d", PowerGlitchSettings["LowFrequency"]) .. "]")
		menu:SetEntryText(highFreqButton, "High Frequency [" .. string.format("%d", PowerGlitchSettings["HighFrequency"]) .. "]")
		menu:SetEntryText(intensityButton, "Intensity [" .. string.format("%.1f", PowerGlitchSettings["Intensity"]) .. "]")
		menu:SetEntryText(blockSizeButton, "Block Size [" .. string.format("%d", PowerGlitchSettings["BlockSize"]) .. "]")
		menu:SetEntryText(fadeTimeButton, "Fade Time [" .. string.format("%d", PowerGlitchSettings["FadeTime"]) .. "]")
		menu:SetEntryEnabled(resetButton, IsPowerGlitchActive())
		menu:SetEntryEnabled(startButton, not IsPowerGlitchActive())
		menu:SetEntryEnabled(lowFreqButton, not IsPowerGlitchActive())
		menu:SetEntryEnabled(highFreqButton, not IsPowerGlitchActive())
		menu:SetEntryEnabled(intensityButton, not IsPowerGlitchActive())
		menu:SetEntryEnabled(blockSizeButton, not IsPowerGlitchActive())
		menu:SetEntryEnabled(fadeTimeButton, not IsPowerGlitchActive())
	end)

	return menu
end

function BlackoutGlitchMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Blackout")

	local resetButton = menu:AddButton("Reset", "Resets and stops the blackout", function()
		--BlackoutSettings["IsActive"] = false

		ScriptHook.ShowNotification("Blackout stopped, energy network is recovering")
		EndAllBlackoutsAfterFinished()
		StartBlackBackupAfterFinished()
	end)

	local startButton = menu:AddButton("Start with parameters", "Starts the blackout", function()
		--BlackoutSettings["IsActive"] = true

		ScriptHook.ShowNotification("Blackout initiated")

		local onlyAffectsLightingVar = 0
		if BlackoutSettings["OnlyAffectsLighting"] == true then
			onlyAffectsLightingVar = 1
		end

		StartBlackoutV2(
			GetLocalPlayerEntityId(), 
			GetLocalPlayerEntityId(),
			BlackoutSettings["PropagationSpeed"],
			BlackoutSettings["RecoverySpeed"], 
			BlackoutSettings["Radius"],
			BlackoutSettings["Duration"],
			BlackoutSettings["Special"],
			onlyAffectsLightingVar
		)
	end)

	local propagationSpeedButton = menu:AddButton("Propagation Speed", "Adjust the propagation speed", Script():CacheMenu(function()
		return AdjustIntegerValue(BlackoutSettings, "Propagation Speed", "PropagationSpeed")
	end))

	local recoverySpeedButton = menu:AddButton("Recovery Speed", "Adjust the recovery speed", Script():CacheMenu(function()
		return AdjustIntegerValue(BlackoutSettings, "Recovery Speed", "RecoverySpeed")
	end))

	local radiusButton = menu:AddButton("Radius", "Adjust the radius", Script():CacheMenu(function()
		return AdjustIntegerValue(BlackoutSettings, "Radius", "Radius")
	end))

	local specialButton = menu:AddButton("Special Effects", "Adjust the special effects", Script():CacheMenu(function()
		return AdjustIntegerValue(BlackoutSettings, "Special Effects", "Special")
	end))

	local durationButton = menu:AddButton("Duration", "Adjust the duration", Script():CacheMenu(function()
		return AdjustIntegerValue(BlackoutSettings, "Duration", "Duration")
	end))

	local onlyAffectsLightingButton = menu:AddButton("Only Affects Lightning", "Adjust is only lightning is affected", Script():CacheMenu(function()
		return AdjustBooleanValue(BlackoutSettings, "Only Affects Lightning", "OnlyAffectsLighting")
	end))

	--function IsBlackoutActive()
	--	return BlackoutSettings["IsActive"]
	--end

	menu:OnUpdate(function()
		menu:SetEntryText(propagationSpeedButton, "Propagation Speed [" .. string.format("%d", BlackoutSettings["PropagationSpeed"]) .. "]")
		menu:SetEntryText(recoverySpeedButton, "Recovery Speed [" .. string.format("%d", BlackoutSettings["RecoverySpeed"]) .. "]")
		menu:SetEntryText(radiusButton, "Radius [" .. string.format("%d", BlackoutSettings["Radius"]) .. "]")
		menu:SetEntryText(specialButton, "Special Effects [" .. string.format("%d", BlackoutSettings["Special"]) .. "]")
		menu:SetEntryText(durationButton, "Duration [" .. string.format("%d", BlackoutSettings["Duration"]) .. "]")
		menu:SetEntryText(onlyAffectsLightingButton, "Only Affects Lightning [" .. string.format("%s", BooleanToString(BlackoutSettings["OnlyAffectsLighting"], true)) .. "]")

		--menu:SetEntryEnabled(resetButton, IsBlackoutActive())
		--menu:SetEntryEnabled(startButton, not IsBlackoutActive())
		--menu:SetEntryEnabled(propagationSpeedButton, not IsBlackoutActive())
		--menu:SetEntryEnabled(recoverySpeedButton, not IsBlackoutActive())
		--menu:SetEntryEnabled(radiusButton, not IsBlackoutActive())
		--menu:SetEntryEnabled(specialButton, not IsBlackoutActive())
		--menu:SetEntryEnabled(durationButton, not IsBlackoutActive())
		--menu:SetEntryEnabled(onlyAffectsLightingButton, not IsBlackoutActive())
	end)
	
	return menu
end


function LoadLayer(name)
	LoadLMALayer(name, "0", 0, function()
		--print("Loaded")
	end, "")
end

function UnloadLayer(name)
	UnloadLMALayer(name, function()
		--print("Unloaded")
	end, "")
end

function OpenWorldLoadingUnitCategoryItemMenu(name)
	local menu = UI.SimpleMenu()
	menu:SetTitle("WLU " .. name)

	menu:AddButton("Load", "Loads the world loading unit", function(menu, text, hint, index) 
		LoadLayer(name)
		ScriptHook.ShowNotification("Loading WLU " .. name)
	end)

	menu:AddButton("Unload", "Unloads the world loading unit", function(menu, text, hint, index) 
		UnloadLayer(name)
		ScriptHook.ShowNotification("Unloading WLU " .. name)
	end)

	return menu
end

function OpenWorldLoadingUnitCategoryMenu(title, tbl)
	local menu = UI.SimpleMenu()
	menu:SetTitle(title)

	local activeTable = tbl
	for index,value in ipairs(tbl) do
		menu:AddButton(value, Script():CacheMenu(function()
			return OpenWorldLoadingUnitCategoryItemMenu(value)
		end))
	end

	return menu
end

local WorldLoadingUnit_Categories = {
	{ "Generic", WLUS["Generic"] },
	{ "Coop", WLUS["Coop"] },
	{ "Drone Race", WLUS["Drone Race"] },
	{ "IOP", WLUS["IOP"] },
	{ "Oakwood", WLUS["Oakwood (Town)"] },
	{ "San Francisco", WLUS["San Francisco (Town)"] },
	{ "Silicon Valley", WLUS["Silicon Valley"] },
	{ "Marin", WLUS["Marin"] },
	{ "World Stories - Solo", WLUS["Story"] },
	{ "World Stories - Light", WLUS["L"] },
	{ "PL", WLUS["PL"] },
	{ "Debug", WLUS["Debug"] }
}

function WorldLoadingUnitsMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("World Loading Units")

	for _,v in pairsByKeys(WorldLoadingUnit_Categories) do
		local name, tbl = unpack(v)

		menu:AddButton(name, Script():CacheMenu(function()
			return OpenWorldLoadingUnitCategoryMenu(name, tbl)
		end))
	end
	return menu
end

function TogglectOSMalfunction()
    if ctOSMalfunction == true then
        StopRandomHackingFromPlayer()
		ctOSMalfunction = false
    else
        StartRandomHackingFromPlayer()
		ctOSMalfunction = true
    end
end

function ToggleLifeScoreProfiler()
    if LifeScoreProfiler == true then
        SetLifeValueAutoProfiling(0)
		LifeScoreProfiler = false
    else
        SetLifeValueAutoProfiling(1)
		LifeScoreProfiler = true
    end
end

function ShutdownTV()
	TriggerShutdownTvPower( GetLocalPlayerEntityId(), 10, 25 )
	ScriptHook.ShowNotification("TV's Shut down")
end

function TrafficLightMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Trafficlights")

	local defaultButton = menu:AddButton("Default", function()
		return ScriptHook.SetGlobalTrafficLightState(4)
	end)

	local greenButton = menu:AddButton("Force Green", function()
		return ScriptHook.SetGlobalTrafficLightState(0)
	end)

	local yellowButton = menu:AddButton("Force Yellow", function()
		return ScriptHook.SetGlobalTrafficLightState(1)
	end)

	local redButton = menu:AddButton("Force Red", function()
		return ScriptHook.SetGlobalTrafficLightState(2)
	end)

	local disabledButton = menu:AddButton("Force turned off", function()
		return ScriptHook.SetGlobalTrafficLightState(3)
	end)

	menu:OnUpdate(function()
		local state = ScriptHook.GetGlobalTrafficLightState()
		
		local greenText = "Force Green"
		local yellowText = "Force Yellow"
		local redText = "Force Red"
		local disabledText = "Force turned off"
		local defaultText = "Default"

		if state == 0 then
			greenText = "[ON] " .. greenText
		elseif state == 1 then
			yellowText = "[ON] " .. yellowText
		elseif state == 2 then
			redText = "[ON] " .. redText
		elseif state == 3 then
			disabledText = "[ON] " .. disabledText
		elseif state == 4 then
			defaultText = "[ON] " .. defaultText
		end 

		menu:SetEntryText(greenButton, greenText)
		menu:SetEntryText(yellowButton, yellowText)
		menu:SetEntryText(redButton, redText)
		menu:SetEntryText(disabledButton, disabledText)
		menu:SetEntryText(defaultButton, defaultText)
	end)
	
	return menu
end

function OpenDynamicEventCategory(title, tbl)
	local menu = UI.SimpleMenu()
	menu:SetTitle(title)
	for _, v in pairs(tbl.events) do
		local name, event = unpack(v)
		menu:AddButton(name, "DynamicEvent." .. event, function(menu, text, hint, index)
			ScriptHook.ShowNotification("Attempting to start event: \n" .. text)
			SetForcedDynamicEvent("DynamicEvent." .. event)
		end)
	end	

	return menu
end

function DynamicEventsMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Dynamic Events")

	for _, v in ipairs(DynamicEventsList) do
	menu:AddButton(v.name, v.desc, Script():CacheMenu(function() return OpenDynamicEventCategory(v.name, v) end))
	end
	
	menu:AddButton("Trigger Ambush", "WD2E: Triggers Prime_Eight Ambush", function(menu, text, hint, index)
	Globals.FREEROAM.TriggerAmbushNow = 1
	end)

	return menu
end

-- Environment
function EnvironmentMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("World & Environment")
	
	-- Items
	menu:AddButton("Time", TimeMenu)
	menu:AddButton("Time Scale", TimeScaleMenu)
	menu:AddButton("Weather", Script():CacheMenu(WeatherMenu))
	menu:AddButton("Dynamic Events", "Start DedSec Events and Emergent Events", Script():CacheMenu(DynamicEventsMenu))
	menu:AddButton("World Spawner", Script():CacheMenu(SpawnerMenu))
	menu:AddButton("World Trafficlights", "Set the a state for all traffic lights", Script():CacheMenu(TrafficLightMenu))
	menu:AddButton("World Loading Units", Script():CacheMenu(WorldLoadingUnitsMenu))
	menu:AddButton("Media Broadcast", Script():CacheMenu(MediaBroadcast))
	menu:AddButton("Clone Entity", "Clone the entity you're aiming at with your camera", CloneEntity)
	menu:AddButton("Power Glitch", "Cause power glitches in whole San Francisco", Script():CacheMenu(PowerGlitchMenu))
	menu:AddButton("Blackout", "Cause a global Blackout in San Francisco", Script():CacheMenu(BlackoutGlitchMenu))
	menu:AddButton("Shutdown TV", "Triggers lost signal effect on certain TV's", ShutdownTV)
	local ctOSMalfunctionToggleIdx = menu:AddCheckbox("ctOS Malfunction", "Randomly hacks things", TogglectOSMalfunction)
	--local lifeScoreProfilerToggleIdx = menu:AddCheckbox("Life Score Profiler", "Toggle profiling life scores from Automata DLC", ToggleLifeScoreProfiler)
	
	menu:OnUpdate(function()
		menu:SetChecked(ctOSMalfunctionToggleIdx, ctOSMalfunction)
		--menu:SetChecked(lifeScoreProfilerToggleIdx, LifeScoreProfiler)
	end)

	return menu
end

table.insert(SimpleTrainerMenuItems, { "World & Environment", "Control time, weather, start events, etc.", Script():CacheMenu(EnvironmentMenu) })