# WD2ExportAll.py
# Combined Ghidra headless script: exports functions, strings, imports, exports, and calls

from ghidra.program.model.listing import FunctionIterator
from ghidra.program.model.data import StringDataType, UnicodeDataType
from ghidra.program.model.symbol import SymbolType, SourceType
from java.io import PrintWriter, FileWriter

funcMgr = currentProgram.getFunctionManager()
symTab = currentProgram.getSymbolTable()
refMgr = currentProgram.getReferenceManager()
name = currentProgram.getName()

println("=== Exporting functions ===")
functions = funcMgr.getFunctions(True)
fWriter = PrintWriter(FileWriter(name + "_functions.csv"))
fWriter.println("Address,Name,Signature,CallingConvention,Thunk,Inline")

nameList = PrintWriter(FileWriter(name + "_function_names.txt"))
count = 0
while functions.hasNext():
    func = functions.next()
    addr = str(func.getEntryPoint())
    fname = func.getName()
    sig = func.getSignature().getPrototypeString().replace("\"", "\"\"")
    cc = func.getCallingConventionName()
    fWriter.printf("\"%s\",\"%s\",\"%s\",\"%s\",%s,%s\n", addr, fname, sig, cc, func.isThunk(), func.isInline())
    nameList.println(fname)
    count += 1
    if count % 500 == 0:
        println("[*] Functions: " + str(count))

fWriter.close()
nameList.close()
println("[+] Exported " + str(count) + " functions")

println("=== Exporting strings ===")
dataIter = currentProgram.getListing().getDefinedData(True)
sWriter = PrintWriter(FileWriter(name + "_strings.csv"))
sWriter.println("Address,Type,Value,References")

luaWriter = PrintWriter(FileWriter(name + "_lua_strings.txt"))
luaKw = ["lua", "script", "hook", "native", "register", "vehicle", "player",
         "entity", "felony", "noclip", "teleport", "notify", "progression",
         "domino", "engine", "repair", "force", "reward", "cash", "mission",
         "phone", "camera", "hack", "ingredient", "perk", "reputation",
         "postfx", "traffic", "alarm", "chase", "police", "fbi"]

sCount = 0
while dataIter.hasNext():
    data = dataIter.next()
    dt = data.getDataType()
    if isinstance(dt, StringDataType) or isinstance(dt, UnicodeDataType):
        addr = str(data.getAddress())
        tname = dt.getName()
        val = data.getValue()
        refs = refMgr.getReferencesTo(data.getAddress())
        refStr = ""
        for r in refs:
            if refStr: refStr += ";"
            refStr += str(r.getFromAddress())
        if val is not None:
            val = val.replace("\"", "\"\"")
            if len(val) > 200: val = val[:200] + "..."
        sWriter.printf("\"%s\",\"%s\",\"%s\",\"%s\"\n", addr, tname, val if val else "", refStr)
        if val is not None:
            vl = val.lower()
            for kw in luaKw:
                if kw in vl:
                    luaWriter.println(addr + ": " + val)
                    break
        sCount += 1
        if sCount % 500 == 0:
            println("[*] Strings: " + str(sCount))

sWriter.close()
luaWriter.close()
println("[+] Exported " + str(sCount) + " strings")

println("=== Exporting imports ===")
iWriter = PrintWriter(FileWriter(name + "_imports.csv"))
iWriter.println("Address,Library,Function")
syms = symTab.getExternalSymbols()
iCount = 0
while syms.hasNext():
    sym = syms.next()
    if sym.getSymbolType() == SymbolType.FUNCTION:
        iWriter.printf("\"%s\",\"external\",\"%s\"\n", str(sym.getAddress()), sym.getName())
        iCount += 1
iWriter.close()
println("[+] Exported " + str(iCount) + " imports")

println("=== Exporting exports ===")
eWriter = PrintWriter(FileWriter(name + "_exports.csv"))
eWriter.println("Address,Name")
allSyms = symTab.getAllSymbols(True)
eCount = 0
while allSyms.hasNext():
    sym = allSyms.next()
    if sym.isExternalEntryPoint():
        eWriter.printf("\"%s\",\"%s\"\n", str(sym.getAddress()), sym.getName())
        eCount += 1
eWriter.close()
println("[+] Exported " + str(eCount) + " exports")

println("=== Exporting calls ===")
cWriter = PrintWriter(FileWriter(name + "_calls.csv"))
cWriter.println("Caller,Callee,Type")
functions = funcMgr.getFunctions(True)
cCount = 0
while functions.hasNext():
    func = functions.next()
    refs = refMgr.getReferencesFrom(func.getEntryPoint())
    for ref in refs:
        if ref.getReferenceType().isCall():
            callee = symTab.getSymbol(ref.getToAddress())
            if callee is not None:
                cWriter.printf("\"%s\",\"%s\",\"%s\"\n", func.getName(), callee.getName(), str(ref.getReferenceType()))
                cCount += 1
    if cCount % 2000 == 0 and cCount > 0:
        println("[*] Calls: " + str(cCount))

cWriter.close()
println("[+] Exported " + str(cCount) + " calls")
println("=== ALL EXPORTS COMPLETE ===")
