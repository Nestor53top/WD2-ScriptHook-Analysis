-- string.split
function string.split(str, del)
	local result = {}
	del = del or ","
	
	local pattern = string.format("([^%s]+)", del)
	str:gsub(pattern, function(c)
		result[#result + 1] = c
	end)
	
	return result
end

--
function string.stripFileExtension(str)
	local i = str:match(".+()%.%w+$")
	if i then
		return str:sub(1, i - 1)
	end
	return str
end