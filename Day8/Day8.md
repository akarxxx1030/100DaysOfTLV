## FPGA Multiplier in Transaction Level Verilog
Hey there! You've made it past Day 7! Safe to say that basic logic building takes a notch higher in this day as we look to extend our sequential knowledge by adding to the fundamentals covered so far. 🍾
#### Short Recap ⏪
> Ripple Carry Adder! 👀
Feel free to visit [Day7.md](https://github.com/akarxxx1030/100DaysOfTLV/blob/main/Day7/Day7.md) to pick up and let's get started.

```verilog
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
```
<img width="464" alt="8" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/8ea86100-d7cb-4f31-a796-2f4331ce69b8">
<img width="475" alt="8wav" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/8caf38d5-f801-4f13-af70-90f700bb6fc1">


