## Hierarchical Incrementer in Transaction Level Verilog
Hey there! You've made it past Day 5! Safe to say that basic logic building takes a notch higher in this day as we look to extend our sequential knowledge by adding to the fundamentals covered so far. 🍾
#### Short Recap ⏪
> Pythogorean Flex on Transaction Level Verilog! 👀
Feel free to visit [Day5.md](https://github.com/akarxxx1030/100DaysOfTLV/edit/main/Day5/Day5.md) to pick up and let's get started.
```verilog
\TLV
   m4_define(M4_WIDTH, 8)
   
   // The incrementer
   /slice[M4_WIDTH-1:0]
      // Get carry in from previous slice (or 1 into slice 0).
      $carry = (#slice == 0) ? 1'b1
                                : /slice[(#slice - 1) % M4_WIDTH]$carryo;
!     $Value <= *reset ? 1'b0    // reset to zero
                       : $Value ^ $carry;
      $carryo = $Value && $carry;
   
   // Combine output bits into a vector.
   $value[M4_WIDTH-1:0] = /slice[*]$Value;
```
<img width="305" alt="6" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/2bbd0f59-e47b-46cd-b0bf-3ffae02cdd3a">
<img width="449" alt="6wav" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/efe2fd13-53a2-4f17-9118-0af855bcc872">
