-- Util
util = {}

-- Type
function util.Type(val)
	local lua_type = type(val)
	
	if lua_type == "table" and type(val.__type) == "function" then
		return val:__type()
	end
	
	return lua_type
end

-- checkarg
function checkarg(func, value, index, expected_type)
	local actual_type = util.Type(value)
	if actual_type ~= expected_type then
		error(func.." expected argument "..index.." to be "..expected_type.." (got "..actual_type..")")
	end
end

-- checkargfunc
function checkargfunc(func, index, expected_type, callback, ...)
	if callback(unpack({...})) == false then
		error(func.." expected argument "..index.." to be "..expected_type)
	end
end

-- Key
function util.GetKeyName(keycode)
	for name,kc in pairs(KeyCodes) do
		if kc == keycode then
			return name
		end
	end
	
	return "[unknown keycode]"
end
function util.GetKeyCodeFromString(name)
	if type(name) ~= "string" then name = tostring(name) end
	
	for kname,kc in pairs(KeyCodes) do
		if kname == name or tostring(kc) == name then
			return kc
		end
	end
end

-- Implement
ImplementType = {
	Get = 0,
	Set = 1,
	GetSet = 2
}

function util.Implement(tbl, name, itype, expected_type)
	if not tbl then return end
	
	-- Getter
	if itype == ImplementType.Get or itype == ImplementType.GetSet then
		local getname = "Get"
		if expected_type == "boolean" then getname = "Is" end
		
		tbl[getname..name] = function(s)
			return s[name]
		end
	end
	
	-- Setter
	if itype == ImplementType.Set or itype == ImplementType.GetSet then
		tbl["Set"..name] = function(s, val)
			if expected_type then
				checkarg("Set"..name, val, 1, expected_type)
			end
			
			s[name] = val
		end
	end
end

-- CopyTable
function util.CopyTable(tbl) 
	local t = {}
	for k,v in pairs(tbl) do
		t[k] = v
	end
	return t
end

-- PrintTable
function util.PrintTable(tbl)
	for k,v in pairs(tbl) do
		print(k, "=", v)
	end
end