# ExportImportsExports.py
# Ghidra headless script to export imports, exports, and function calls

from ghidra.program.model.symbol import SymbolType, SourceType
from java.io import PrintWriter, FileWriter

symTab = currentProgram.getSymbolTable()
funcMgr = currentProgram.getFunctionManager()

# Export imports
impWriter = PrintWriter(FileWriter(currentProgram.getName() + "_imports.csv"))
impWriter.println("Address,Library,Function")

symbols = symTab.getExternalSymbols()
impCount = 0
while symbols.hasNext():
    sym = symbols.next()
    if sym.getSymbolType() == SymbolType.FUNCTION:
        address = str(sym.getAddress())
        name = sym.getName()
        library = "external"
        impWriter.printf("\"%s\",\"%s\",\"%s\"\n", address, library, name)
        impCount += 1

impWriter.close()
println("[+] Exported " + str(impCount) + " imports")

# Export exports
expWriter = PrintWriter(FileWriter(currentProgram.getName() + "_exports.csv"))
expWriter.println("Address,Name")

allSymbols = symTab.getAllSymbols(True)
expCount = 0
while allSymbols.hasNext():
    sym = allSymbols.next()
    if sym.isExternalEntryPoint():
        address = str(sym.getAddress())
        name = sym.getName()
        expWriter.printf("\"%s\",\"%s\"\n", address, name)
        expCount += 1

expWriter.close()
println("[+] Exported " + str(expCount) + " exports")

# Export function calls
callWriter = PrintWriter(FileWriter(currentProgram.getName() + "_calls.csv"))
callWriter.println("Caller,Callee,Type")

functions = funcMgr.getFunctions(True)
callCount = 0
while functions.hasNext():
    func = functions.next()
    refMgr = currentProgram.getReferenceManager()
    refs = refMgr.getReferencesFrom(func.getEntryPoint())
    
    for ref in refs:
        if ref.getReferenceType().isCall():
            calleeSym = symTab.getSymbol(ref.getToAddress())
            if calleeSym is not None:
                callWriter.printf("\"%s\",\"%s\",\"%s\"\n",
                    func.getName(), calleeSym.getName(), str(ref.getReferenceType()))
                callCount += 1
    
    if callCount % 1000 == 0 and callCount > 0:
        println("[*] Exported " + str(callCount) + " calls...")

callWriter.close()
println("[+] Exported " + str(callCount) + " function calls")
println("[+] Done!")
