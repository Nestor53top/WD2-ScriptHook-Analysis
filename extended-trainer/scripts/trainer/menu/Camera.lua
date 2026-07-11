local enableDOF = true

function ToggleFreeCam()
	ScriptHook.SetLocalPlayerFreeCamera(not ScriptHook.HasLocalPlayerFreeCamera())
end

function ToggleUI()
    if ScriptHook.IsIngameUIEnabled() then
        SendShowOrHideAllUIEvent(0)
    else
        SendShowOrHideAllUIEvent(1)
    end
end

function ToggleDOF()
    if enableDOF == true then
        EnableCameraDoF(GetLocalPlayerEntityId(), 0)
		enableDOF = false
    else
        EnableCameraDoF(GetLocalPlayerEntityId(), 1)
		enableDOF = true
    end
end

function CameraMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Camera")

    local freecamIdx = menu:AddCheckbox("Freecam", "Enable/Disable Freecam", ToggleFreeCam)
    local uiToggleIdx = menu:AddCheckbox("Ingame UI", "Show/Hide ingame UI", ToggleUI)
    local dofToggleIdx = menu:AddCheckbox("DOF", "Toggle Depth Of Field", ToggleDOF)

	--[[
	menu:AddButton("Attach To Aimed Object", function()
		FixPlayerCamera(GetReticleHitEntity(), 70)
	end)
	
	menu:AddButton("Reset To Player", function()
		FreePlayerCamera()
	end)
	]]

	--[[
	menu:AddButton("Reset to player", function()
		ScriptHook.CameraReset()
	end)
	]]

	--[[
	for _, v in pairs(CameraSpots) do
		local name, pos = unpack(v)

		menu:AddButton(name, function(menu, text, hint, index)
			ScriptHook.CameraSetCustom(pos[1], pos[2], pos[3], pos[4], pos[5], pos[6])
		end)
	end]]

	-- Update
	menu:OnUpdate(function()
		menu:SetChecked(freecamIdx, ScriptHook.HasLocalPlayerFreeCamera())
        menu:SetEntryEnabled(freecamIdx, not ScriptHook.HasLocalPlayerNoclip())
        menu:SetChecked(uiToggleIdx, ScriptHook.IsIngameUIEnabled())
		menu:SetChecked(dofToggleIdx, enableDOF)
	end)

	return menu
end

table.insert(SimpleTrainerMenuItems, { "Camera", "Camera & UI Options", Script():CacheMenu(CameraMenu) })