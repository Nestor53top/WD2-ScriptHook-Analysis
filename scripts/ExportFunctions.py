# ExportFunctions.py
# Ghidra headless script to export function list from core.dll

from ghidra.program.model.listing import FunctionIterator
from java.io import PrintWriter, FileWriter

funcMgr = currentProgram.getFunctionManager()
functions = funcMgr.getFunctions(True)

outputPath = currentProgram.getName() + "_functions.csv"
writer = PrintWriter(FileWriter(outputPath))
writer.println("Address,Name,Signature,CallingConvention,Thunk,Inline")

count = 0
while functions.hasNext():
    func = functions.next()
    address = str(func.getEntryPoint())
    name = func.getName()
    signature = func.getSignature().getPrototypeString()
    callingConv = func.getCallingConventionName()
    isThunk = func.isThunk()
    isInline = func.isInline()
    
    signature = signature.replace("\"", "\"\"")
    name = name.replace("\"", "\"\"")
    
    writer.printf("\"%s\",\"%s\",\"%s\",\"%s\",%s,%s\n",
        address, name, signature, callingConv, isThunk, isInline)
    
    count += 1
    if count % 100 == 0:
        println("[*] Exported " + str(count) + " functions...")

writer.close()
println("[+] Exported " + str(count) + " functions to " + outputPath)

# Simple function name list
listWriter = PrintWriter(FileWriter(currentProgram.getName() + "_function_names.txt"))
functions = funcMgr.getFunctions(True)
while functions.hasNext():
    func = functions.next()
    listWriter.println(func.getName())
listWriter.close()

println("[+] Done!")
