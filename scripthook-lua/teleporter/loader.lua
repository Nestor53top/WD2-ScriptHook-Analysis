local script = Script()

local tp_state = {
	target_cords = { nil, nil, nil },
	loaded_layers = {}
}
script.tp_state = tp_state
tp_state._type = tp_state

-- Init/Shutdown
function tp_state:Init()
	local scs = CScriptCallbackSystem_GetInstance()
end

function tp_state:Shutdown()
	local scs = CScriptCallbackSystem_GetInstance()
end

local function find_in_table(search, lma_type)
	for key, value in pairsByKeys(script.tp_state.loaded_layers) do
		local tmp_layer, layer_type = unpack(value)
		if tmp_layer == search and lma_type == layer_type then
			return key
		end
	end
end

-- just load the layer. Commonly used when 2 layers are needed for one teleport
function tp_state:LoadLayer(name)
	ScriptHook.ShowNotification("loading " .. name)
	LoadLMALayer(name, "0", 1, function() end, "")
	table.insert(script.tp_state.loaded_layers, { name, "lma" })
end

-- load a lma layer then use the callback to on_loaded to do the teleport
-- this should fix being stuck in the ground
-- use mssion bool to load a layer that is specific for a mission like "S13M040_Main_ServerFarm"
function tp_state:LoadLayer_and_tp(name, x, y, z, mission)
	ScriptHook.ShowNotification("loading " .. name)
	script.tp_state.target_cords = { x, y, z }

	if mission then
		LoadMissionLayer2("0", tp_state, "on_loaded", name)
		local found_table = find_in_table(name, "mission")
		if found_table ~= nil then
			-- do not duplicate the table entry, just move it to the back
			table.remove(script.tp_state.loaded_layers, found_table)
		end

		table.insert(script.tp_state.loaded_layers, { name, "mission" })
	else
		LoadLMALayer(name, "0", 1, tp_state, "on_loaded")
		local found_table = find_in_table(name, "lma")
		if found_table ~= nil then
			-- do not duplicate the table entry, just move it to the back
			table.remove(script.tp_state.loaded_layers, found_table)
		end

		table.insert(script.tp_state.loaded_layers, { name, "lma" })
	end
end

-- teleport the player after the layer has loaded
function tp_state:on_loaded()
	if script.tp_state.target_cords[1] == nil then
		ScriptHook.ShowNotification("There was an error!", 15)
	elseif script.tp_state.target_cords[2] == nil then
		ScriptHook.ShowNotification("There was an error!", 15)
	elseif script.tp_state.target_cords[3] == nil then
		ScriptHook.ShowNotification("There was an error!", 15)
	else
		-- teleport
		SetEntityPosition(GetLocalPlayerEntityId(), script.tp_state.target_cords[1], script.tp_state.target_cords[2], script.tp_state.target_cords[3])
		-- unload the last loaded mission
		script.tp_state:unload_last_mission()
	end
end

-- unload the last loaded mission
function tp_state:unload_last_mission()
	if tablelength(script.tp_state.loaded_layers) > 2 then
		local tmp_layer, layer_type = unpack(script.tp_state.loaded_layers[1])
		ScriptHook.ShowNotification("unloading " .. tmp_layer)
		if layer_type == "mission" then
			UnloadMissionLayer2("0", tp_state, "", tmp_layer)
		elseif layer_type == "lma" then
			UnloadLMALayer(tmp_layer, tp_state, "")
		else
			print("unknown layer type " .. layer_type)
		end
		table.remove(script.tp_state.loaded_layers, 1)
	end
end


function just_tp(x, y, z)
	SetEntityPosition(GetLocalPlayerEntityId(), x, y, z)
	script.tp_state:unload_last_mission()
end

local function GetFelonyTypeID(felonyTypeName)
	return Fractions[felonyTypeName]
end

local function ClearWanted()
	local selectedFraction = "Police"
	FelonyEndChaseOrSearch(GetLocalPlayerEntityId(), GetFelonyTypeID(selectedFraction), 1)
	ScriptHook.ClearHeatLevel(GetFelonyTypeID(selectedFraction))
end

-- unload the last loaded mission layer on script unload
function script:OnUnload()
	script.tp_state:unload_last_mission()
end