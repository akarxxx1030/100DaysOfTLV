## Introduction to Sequential Logic in Transaction Level Verilog
---
Hey there! You've made it past Day 2! Safe to say that basic logic building takes a notch higher in this day as we look to combat sequential examples adding to the fundamentals covered so far. 🍾

#### Short Recap ⏪
> Combinatorial Logic Designs encompassing half-adder, full-adder, half-subtractor, and hierarchical multiplexer logic!
Feel free to visit [Day2.md](https://github.com/akarxxx1030/100DaysOfTLV/blob/main/Day2/Day2.md) to pick up and let's get started.

Flip-Flops are Digital Circuits that follow Sequential Logic when accomplishing tasks dealing with storing and transferring data in the form of bits. This exercise looks at instantiating and implementing a simple D Flip-Flop in Transaction-Level Verilog!

## D Flip-Flop 
---
### Truth Table
<img width="159" alt="dff" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/e0a9dc67-377d-4f6e-a3e1-26f81ed09727"> 

In most cases,(which we will look into later)TLV assumes and places flops wherever it's required! (*Perks of TLV!*))
But if we want to program a single D-FF explicitly, it goes this way:
```verilog
\TLV
   |dff
      @0
         $output = >>1$in;
```

>Code reduction in comparison to System Verilog HDL is near *infinite* 👀

System Verilog HDL's implementation of a D-FF:
```verilog
module dff(input logic clk, input logic d, output logic q);
always_ff
q <= d;
endmodule
```
>TLV's simplicity also makes it easier for the designer to pin-point and focus on aspects of the design that require more attention while reducing the baggage of register values and declarations that hinder the designer's flow.
<img width="195" alt="3" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/a755cd81-9730-441b-9c54-f26f19cd8e15">
<img width="458" alt="3wav" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/c3e60241-ef52-4052-83cd-4bb995ff3dda">



