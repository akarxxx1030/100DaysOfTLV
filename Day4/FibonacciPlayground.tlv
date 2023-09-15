\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome to Fibonacci Playground!
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   //...
   
   // Assert these to end simulation (before Makerchip cycle limit).
   $fiboout[15:0] = $reset? 1 : >>1$fiboout + >>2$fiboout;
\SV
   endmodule
