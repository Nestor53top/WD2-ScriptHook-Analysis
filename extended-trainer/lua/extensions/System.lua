-- System
local meta_System = getmetatable(System).__index
meta_System._Log = meta_System._Log or meta_System.Log
meta_System._Warning = meta_System._Warning or meta_System.Warning
meta_System._Error = meta_System._Error or meta_System.Error

-- System:Log Hook
function meta_System.Log(self, msg)
	print("[Game Lua Log] "..msg)
	return self:_Log(msg)
end

-- System:Warning Hook
function meta_System.Warning(self, msg)
	print("[Game Lua Warning] "..msg)
	return meta_System:_Warning(msg)
end

-- System:Error Hook
function meta_System.Error(self, msg)
	print("[Game Lua Error] "..msg)
	return meta_System:_Error(msg)
end