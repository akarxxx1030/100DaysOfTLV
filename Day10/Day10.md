## 32 bit Arithmetic and Logical Unit in Transaction Level Verilog
Hey there! You've made it past Day 9! Safe to say that basic logic building takes a notch higher in this day as we look to extend our sequential knowledge by adding to the fundamentals covered so far. 🍾
#### Short Recap ⏪
> Long Division in TLV! 👀
Feel free to visit [Day9.md](https://github.com/akarxxx1030/100DaysOfTLV/blob/main/Day9/Day9.md) to pick up and let's get started.
```verilog
\TLV
   |alu
      @0
         $sum[31:0]= $input1[31:0] + $input2[31:0];
         $and[31:0] = $input1[31:0] && $input2[31:0];
         $or[31:0] = $input1[31:0] || $input2[31:0];
         $not[31:0] = !$input[31:0];
```
<img width="185" alt="10" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/538a740d-ccd7-4976-9f26-06063903c151">
