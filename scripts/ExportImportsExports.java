// ExportImportsExports.java
// Ghidra headless script to export imports and exports
// Run with: analyzeHeadless.bat projectDir projectName -postScript ExportImportsExports.java

import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.address.*;
import java.io.*;

public class ExportImportsExports extends GhidraScript {
    
    @Override
    public void run() throws Exception {
        println("[*] Starting imports/exports export...");
        
        // Export imports
        PrintWriter impWriter = new PrintWriter(new FileWriter(currentProgram.getName() + "_imports.csv"));
        impWriter.println("Address,Library,Function,Ordinal");
        
        SymbolTable symTab = currentProgram.getSymbolTable();
        SymbolIterator symbols = symTab.getExternalSymbols();
        
        int impCount = 0;
        while (symbols.hasNext() && !monitor.isCancelled()) {
            Symbol sym = symbols.next();
            if (sym.getSymbolType() == SymbolType.FUNCTION) {
                String address = sym.getAddress().toString();
                String name = sym.getName();
                
                // Try to get library name
                String library = "";
                if (sym.getSource() == SourceType.DEFAULT) {
                    // External symbol
                    library = "external";
                }
                
                impWriter.printf("\"%s\",\"%s\",\"%s\"%n", address, library, name);
                impCount++;
            }
        }
        impWriter.close();
        println("[+] Exported " + impCount + " imports");
        
        // Export exports
        PrintWriter expWriter = new PrintWriter(new FileWriter(currentProgram.getName() + "_exports.csv"));
        expWriter.println("Address,Name,Ordinal");
        
        SymbolIterator allSymbols = symTab.getAllSymbols(true);
        int expCount = 0;
        
        while (allSymbols.hasNext() && !monitor.isCancelled()) {
            Symbol sym = allSymbols.next();
            if (sym.isExternalEntryPoint()) {
                String address = sym.getAddress().toString();
                String name = sym.getName();
                
                expWriter.printf("\"%s\",\"%s\"%n", address, name);
                expCount++;
            }
        }
        expWriter.close();
        println("[+] Exported " + expCount + " exports");
        
        // Export function calls (cross-references)
        PrintWriter callWriter = new PrintWriter(new FileWriter(currentProgram.getName() + "_calls.csv"));
        callWriter.println("Caller,Callee,Type");
        
        FunctionManager funcMgr = currentProgram.getFunctionManager();
        FunctionIterator functions = funcMgr.getFunctions(true);
        
        int callCount = 0;
        while (functions.hasNext() && !monitor.isCancelled()) {
            Function func = functions.next();
            
            // Get called functions
            ReferenceManager refMgr = currentProgram.getReferenceManager();
            Reference[] refs = refMgr.getReferencesFrom(func.getEntryPoint());
            
            for (Reference ref : refs) {
                if (ref.getReferenceType().isCall()) {
                    Symbol calleeSym = symTab.getSymbol(ref.getToAddress());
                    if (calleeSym != null) {
                        callWriter.printf("\"%s\",\"%s\",\"%s\"%n",
                            func.getName(), calleeSym.getName(), ref.getReferenceType().toString());
                        callCount++;
                    }
                }
            }
            
            if (callCount % 1000 == 0 && callCount > 0) {
                println("[*] Exported " + callCount + " calls...");
            }
        }
        callWriter.close();
        println("[+] Exported " + callCount + " function calls");
        
        println("[+] Done!");
    }
}
