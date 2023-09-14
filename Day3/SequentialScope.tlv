\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome to TLV's Simplistic DFF implementation.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   //$output = >>1$input;
   |dff
      @0
         $output = >>1$in;
      
      
         
   
   //...
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
