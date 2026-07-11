// ExportFunctions.java
// Ghidra headless script to export function list from core.dll
// Run with: analyzeHeadless.bat projectDir projectName -postScript ExportFunctions.java

import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.address.*;
import java.io.*;
import java.util.*;

public class ExportFunctions extends GhidraScript {
    
    @Override
    public void run() throws Exception {
        println("[*] Starting function export...");
        
        // Get all functions
        FunctionManager funcMgr = currentProgram.getFunctionManager();
        FunctionIterator functions = funcMgr.getFunctions(true);
        
        // Create output file
        String outputPath = currentProgram.getName() + "_functions.csv";
        PrintWriter writer = new PrintWriter(new FileWriter(outputPath));
        writer.println("Address,Name,Signature,CallingConvention,Thunk,Inline");
        
        int count = 0;
        while (functions.hasNext() && !monitor.isCancelled()) {
            Function func = functions.next();
            
            String address = func.getEntryPoint().toString();
            String name = func.getName();
            String signature = func.getSignature().getPrototypeString();
            String callingConv = func.getCallingConventionName();
            boolean isThunk = func.isThunk();
            boolean isInline = func.isInline();
            
            // Escape CSV
            signature = signature.replace("\"", "\"\"");
            name = name.replace("\"", "\"\"");
            
            writer.printf("\"%s\",\"%s\",\"%s\",\"%s\",%s,%s%n",
                address, name, signature, callingConv, isThunk, isInline);
            
            count++;
            if (count % 100 == 0) {
                println("[*] Exported " + count + " functions...");
            }
        }
        
        writer.close();
        println("[+] Exported " + count + " functions to " + outputPath);
        
        // Also export as simple list for string matching
        PrintWriter listWriter = new PrintWriter(new FileWriter(currentProgram.getName() + "_function_names.txt"));
        functions = funcMgr.getFunctions(true);
        while (functions.hasNext() && !monitor.isCancelled()) {
            Function func = functions.next();
            listWriter.println(func.getName());
        }
        listWriter.close();
        
        println("[+] Done!");
    }
}
