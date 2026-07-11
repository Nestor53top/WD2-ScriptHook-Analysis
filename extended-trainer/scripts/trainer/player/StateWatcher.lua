-- StateWatcher is a watchdog for the local player's entity. Its used to store variables ("states") of the player
-- until the player dies. Example: stores if the player has God mode on / off
--
-- The current implementation of this isn't great. We're checking the entity id each frame to see if it's still
-- valid and alive. Instead, we should be using event callbacks.
local StateWatcher = {
	EventIDs = {},
	State = {}
}
Script().StateWatcher = StateWatcher

-- we need this to make the callbacks work
StateWatcher._type = StateWatcher

-- Init/Shutdown
function StateWatcher:Init()
	local scs = CScriptCallbackSystem_GetInstance()
	--self.EventIDs.OnDie = scs:RegisterMissionEventCallback(GetLocalPlayerEntityId(), self, "OnDie", "Die", -1)
end

function StateWatcher:Shutdown()
	local scs = CScriptCallbackSystem_GetInstance()
	--scs:RemoveCallback(GetLocalPlayerEntityId(), self.EventIDs.OnDie)
end

-- Timer
function StateWatcher:OnUpdate()
	local curPlyId = GetLocalPlayerEntityId()
	if curPlyId == GetInvalidEntityId() or curPlyId ~= self.PlayerId or IsAlive(curPlyId) == 0 then
		self.State = {}
	end

	self.PlayerId = curPlyId

	-- States
	if self:GetState("unlimitedClip") then
		self:UnlimitedClip()
	end
	
	if self:GetState("unlimitedProjectiles") then
		self:UnlimitedProjectiles()
	end
end

function StateWatcher:OnDie()
	self.State = {}
end

-- State
function StateWatcher:SetState(key, val)
	self.State[key] = val
end
function StateWatcher:GetState(key)
	return self.State[key]
end

-- Unlimited Ammo
function StateWatcher:UnlimitedClip()
	for i = 0, 5, 1 do
		ModifyBulletsInClip(GetLocalPlayerEntityId(), i, 999, 9999)
	end
end

-- Unlimited Projectiles
function StateWatcher:UnlimitedProjectiles()
	if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569154") == 1 then --Explosive Projectiles
	SetItem("Items.9223372048779332549", 5)
	end

	if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569199") == 1 then --Shock Projectiles
	SetItem("Items.9223372046063608332", 5)
	end
	
	if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569154") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569199") == 1 then --Both
	SetItem("Items.9223372048779332539", 5) --Frag Grenade
	SetItem("Items.9223372048779332558", 5) --Proxy IED
	SetItem("Items.9223372048779332555", 5) --Proxy IED (P8)
	SetItem("Items.9223372048779332538", 10) --Shock Grenade
	SetItem("Items.9223372048779332554", 5) --Lure
	end

end