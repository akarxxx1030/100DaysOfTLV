## Ripple Carry Adder in Transaction Level Verilog via Pre-Existing Macros!
Hey there! You've made it past Day 6! Safe to say that basic logic building takes a notch higher in this day as we look to extend our sequential knowledge by adding to the fundamentals covered so far. 🍾
#### Short Recap ⏪
> Hierarchical Incrementer! 👀
Feel free to visit [Day6.md](https://github.com/akarxxx1030/100DaysOfTLV/blob/main/Day6/Day6.md) to pick up and let's get started.

```verilog
\TLV
   m4_define(['m4_width'], 32)
   $addend1[m4_width-1:0] = *cyc_cnt[m4_width-1:0];
   $addend2[m4_width-1:0] = *cyc_cnt[m4_width-1:0] + 8'b1;
   m4+ripple_carry_adder(m4_width, $addend1, $addend2, $sum, /top)
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
```
<img width="356" alt="7" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/3c176e20-7549-4cc7-a0b5-bb9a5748d57c">
<img width="683" alt="7wav" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/c944dec4-c503-47df-8274-8fe6ee8d93d7">

