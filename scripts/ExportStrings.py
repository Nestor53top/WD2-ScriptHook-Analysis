# ExportStrings.py
# Ghidra headless script to export strings and Lua-related strings

from ghidra.program.model.data import StringDataType, UnicodeDataType
from ghidra.program.model.symbol import ReferenceManager
from java.io import PrintWriter, FileWriter

dataIter = currentProgram.getListing().getDefinedData(True)

writer = PrintWriter(FileWriter(currentProgram.getName() + "_strings.csv"))
writer.println("Address,Type,Value,References")

count = 0
while dataIter.hasNext():
    data = dataIter.next()
    dt = data.getDataType()
    
    if isinstance(dt, StringDataType) or isinstance(dt, UnicodeDataType):
        address = str(data.getAddress())
        typeName = dt.getName()
        value = data.getValue()
        
        refMgr = currentProgram.getReferenceManager()
        refs = refMgr.getReferencesTo(data.getAddress())
        
        refList = ""
        for ref in refs:
            if refList:
                refList += ";"
            refList += str(ref.getFromAddress())
        
        if value is not None:
            value = value.replace("\"", "\"\"")
            if len(value) > 200:
                value = value[:200] + "..."
        
        writer.printf("\"%s\",\"%s\",\"%s\",\"%s\"\n",
            address, typeName, value if value else "", refList)
        
        count += 1
        if count % 500 == 0:
            println("[*] Exported " + str(count) + " strings...")

writer.close()
println("[+] Exported " + str(count) + " strings")

# Lua-related strings
luaWriter = PrintWriter(FileWriter(currentProgram.getName() + "_lua_strings.txt"))
dataIter = currentProgram.getListing().getDefinedData(True)

luaKeywords = ["lua", "Lua", "script", "Script", "hook", "Hook",
               "native", "Native", "Register", "Get", "Set", "Enable",
               "Vehicle", "Player", "Entity", "Felony", "Noclip", "Teleport",
               "Notify", "Progression", "Domin", "Engine", "Repair",
               "Force", "Reward", "Cash", "Follow", "Unfollow",
               "Mission", "Phone", "Camera", "Hacking"]

while dataIter.hasNext():
    data = dataIter.next()
    dt = data.getDataType()
    
    if isinstance(dt, StringDataType) or isinstance(dt, UnicodeDataType):
        value = data.getValue()
        if value is not None:
            for kw in luaKeywords:
                if kw.lower() in value.lower():
                    luaWriter.println(str(data.getAddress()) + ": " + value)
                    break

luaWriter.close()
println("[+] Done!")
