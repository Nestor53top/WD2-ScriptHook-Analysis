timer = timer or {
	Pool = {},
	_SimpleTimerIndex = 0
}

-- timer.Instance
timer.Instance = {}
timer.Instance.__index = timer.Instance
timer.Instance._type = timer.Instance
timer.Instance.HasStarted = false

-- Start Timer
function timer.Instance:Start()
	if self.HasStarted then
		error("timer.Instance:Start: Timer "..self.Name.." already started!")
	end
	
	self.DelayID = CDominoDelayManager_GetInstance():CreateDelay(self.Seconds, self, "OnTimeElapsed", 0, 1)
	if not self.DelayID then
		error("timer.Instance:Start: Timer "..self.Name.." -> CreateDelay failed!")
	end
	
	self:_SendCommand("restart")
end

-- Pause Timer
function timer.Instance:Pause()
	if self.DelayID ~= nil then
		self:_SendCommand("pause")
	end
end

-- Resume Timer
function timer.Instance:Resume()
	if self.DelayID ~= nil then
		self:_SendCommand("resume")
	end
end

-- Stop Timer
function timer.Instance:Stop()
	if self.DelayID then
		self:_SendCommand("stop")
		CDominoDelayManager_GetInstance():RemoveDelay(self.DelayID)
		self.DelayID = nil
	end
end

-- Restart Timer
function timer.Instance:Restart()
	if self.DelayID ~= nil then
		self:_SendCommand("restart")
	end
end

-- Get Remaining Time
function timer.Instance:GetRemainingTime()
	if self.DelayID then
		return CDominoDelayManager_GetInstance():GetDelay(self.DelayID)
	end
	
	return 0
end

-- Internal: _OnTimeElapsed
function timer.Instance:OnTimeElapsed()
	local st, err = pcall(function()
		return self:Callback(unpack(self.CallbackArgs))
	end)
	
	if not st then
		print("Timer ("..self.Name..") caused an Error: "..err)
		print(debug.traceback())
	end
	
	if self.Count == 0 then
		self:Restart()
	else	
		self.Count = self.Count - 1
		if self.Count > 0 then
			self:Restart()
		else
			timer.Remove(self.Name)
		end
	end
end

-- Internal: _SendCommand
function timer.Instance:_SendCommand(cmd)
	if self.DelayID then
		CDominoDelayManager_GetInstance():SendCommand(self.DelayID, cmd)
	end
end

-- Create Timer
function timer.Create(name, seconds, count, callback, ...)
	if type(name) ~= "string" then
		error("timer.Create: Expected argument name to be a string!")
	end
	if timer.Pool[name] ~= nil then
		error("timer.Create: There is already a Timer called "..name)
	end

	local inst = setmetatable({}, timer.Instance)
	inst.Name = name
	inst.Seconds = seconds or 1
	inst.Count = count or 1
	inst.Callback = callback or function() end
	inst.CallbackArgs = {...}
	inst:Start()
	
	timer.Pool[name] = inst
	return inst
end

-- Simple Timer
-- Can only run once and has no name
function timer.Simple(seconds, callback, ...)
	timer._SimpleTimerIndex = timer._SimpleTimerIndex + 1
	return timer.Create("_SimpleTimer_"..timer._SimpleTimerIndex, seconds, 1, callback, unpack({...}))
end

-- Access a (named) Timer
function timer.Get(name)
	return timer.Pool[name]
end

-- Remove Timer
function timer.Remove(name)
	if type(name) == "table" and getmetatable(name) == timer.Instance then
		name = name.Name
	end

	local t = timer.Pool[name]
	if not t then
		error("timer.Remove: There is no timer called "..name)
	end
	
	t:Stop()
	timer.Pool[name] = nil
end
function timer.RemoveIfExists(name)
	if timer.Get(name) then
		timer.Remove(name)
	end
end