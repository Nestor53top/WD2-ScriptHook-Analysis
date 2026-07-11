// ExportStrings.java
// Ghidra headless script to export strings and their references
// Run with: analyzeHeadless.bat projectDir projectName -postScript ExportStrings.java

import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.address.*;
import ghidra.program.model.data.*;
import java.io.*;
import java.util.*;

public class ExportStrings extends GhidraScript {
    
    @Override
    public void run() throws Exception {
        println("[*] Starting string export...");
        
        // Get all defined strings
        DataIterator dataIter = currentProgram.getListing().getDefinedData(true);
        
        PrintWriter writer = new PrintWriter(new FileWriter(currentProgram.getName() + "_strings.csv"));
        writer.println("Address,Type,Value,References");
        
        int count = 0;
        while (dataIter.hasNext() && !monitor.isCancelled()) {
            Data data = dataIter.next();
            
            if (data.getDataType() instanceof StringDataType || 
                data.getDataType() instanceof UnicodeDataType) {
                
                String address = data.getAddress().toString();
                String type = data.getDataType().getName();
                String value = data.getValue();
                
                // Get references to this string
                ReferenceManager refMgr = currentProgram.getReferenceManager();
                Reference[] refs = refMgr.getReferencesTo(data.getAddress());
                
                StringBuilder refList = new StringBuilder();
                for (Reference ref : refs) {
                    if (refList.length() > 0) refList.append(";");
                    refList.append(ref.getFromAddress().toString());
                }
                
                // Escape CSV
                if (value != null) {
                    value = value.replace("\"", "\"\"");
                    if (value.length() > 200) {
                        value = value.substring(0, 200) + "...";
                    }
                }
                
                writer.printf("\"%s\",\"%s\",\"%s\",\"%s\"%n",
                    address, type, value != null ? value : "", refList.toString());
                
                count++;
                if (count % 500 == 0) {
                    println("[*] Exported " + count + " strings...");
                }
            }
        }
        
        writer.close();
        println("[+] Exported " + count + " strings");
        
        // Export Lua-related strings specifically
        PrintWriter luaWriter = new PrintWriter(new FileWriter(currentProgram.getName() + "_lua_strings.txt"));
        dataIter = currentProgram.getListing().getDefinedData(true);
        
        while (dataIter.hasNext() && !monitor.isCancelled()) {
            Data data = dataIter.next();
            if (data.getDataType() instanceof StringDataType || 
                data.getDataType() instanceof UnicodeDataType) {
                
                String value = data.getValue();
                if (value != null && (
                    value.contains("lua") || value.contains("Lua") ||
                    value.contains("script") || value.contains("Script") ||
                    value.contains("hook") || value.contains("Hook") ||
                    value.contains("native") || value.contains("Native") ||
                    value.contains("Register") || value.contains("Get") ||
                    value.contains("Set") || value.contains("Enable") ||
                    value.contains("Vehicle") || value.contains("Player") ||
                    value.contains("Entity") || value.contains("Felony"))) {
                    
                    luaWriter.println(data.getAddress() + ": " + value);
                }
            }
        }
        luaWriter.close();
        
        println("[+] Done!");
    }
}
