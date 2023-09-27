\m4_TLV_version 1d: tl-x.org
\SV
   // Based on the design from: http://surf-vhdl.com/how-to-implement-pipeline-multiplier-vhdl/?utm_source=mult-pipe&utm_medium=LK2&utm_campaign=ACLEAD
   // Converted to TL-Verilog with validity added, as well as inline stimulus and checking.
   
   // The logic diagram for this example, from Surf VHDL is (originally) here:
   //   http://surf-vhdl.com/wp/wp-content/uploads/2016/12/Mult-35x35_break_PIPE2.jpg

   m4_makerchip_module
 
\TLV
   |mul
      ?$valid
         
         // Random stimulus
         @0
            m4_rand($aa, 34, 0)
            m4_rand($bb, 34, 0)
         
         
         // 1. A.lower * B.lower (green rectangle in surf-vhdl diagram)
         @1
            $pp1[33:0] = $aa[16:0] * $bb[16:0];
         @2
            $mm1[16:0] = $pp1[16:0];
         
         // 2. A.lower * B.upper (lower purple rectangle in surf-vhdl diagram)
         @2
            $pp2[51:17] = $aa[16:0] * $bb[34:17];
         @3
            $mm2[52:17] = $pp2[51:17] + $pp1[33:17];
         
         // 3. A.upper * B.lower (upper purple rectangle in surf-vhdl diagram)
         @3
            $pp3[51:17] = $aa[34:17] * $bb[16:0];
         @4
            $mm3[52:17] = $pp3[51:17] + $mm2[52:17];
         
         // 4. A.upper * B.upper (orange rectangle in surf-vhdl diagram)
         @4
            $pp4[69:34] = $aa[34:17] * $bb[34:17];
         @5
            $mm4[69:34] = $pp4[69:34] + $mm3[52:34];
         
         // Output
         @6
            $mm[69:0] = {$mm4[69:34], $mm3[33:17], $mm1[16:0]};
         
         
         //---------------------
         // Testbench (inlined)
         
         // Perform full width multiplication and compare with DUT result.
         @7
            $mm_full[69:0] = $aa * $bb;
            // Sticky error flag.
            $Error <= *reset ? 0 : $Error || ($mm_full != $mm);
            
            
            // Assert these to end simulation (before Makerchip cycle limit).
            *passed = *cyc_cnt > 40;
            *failed = $Error;
 
\SV
   endmodule
