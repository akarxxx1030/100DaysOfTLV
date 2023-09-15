## Sequential Logic Extended, It's Fibonacci Time!
Hey there! You've made it past Day 3! Safe to say that basic logic building takes a notch higher in this day as we look to extend our sequential knowledge by adding to the fundamentals covered so far. 🍾

#### Short Recap ⏪
> DFF Implementation in Transaction Level Verilog including a code size reduction exercise comparing TLV to RTL! 👀
Feel free to visit [Day3.md](https://github.com/akarxxx1030/100DaysOfTLV/blob/main/Day3/Day3.md) to pick up and let's get started.

Before we dive in to the example, let's quickly visit what fibonacci sequences translate to! 
## Fibonacci Numbers

Fibonacci numbers follow a sequence where each number is the sum of the previous two, typically starting with 0 and 1. They're found in nature, art, and mathematics, adding a touch of elegance to various patterns and calculations. 

>The Fibonacci sequence with 10 elements is as follows:
0, 1, 1, 2, 3, 5, 8, 13, 21, 34
## TLV Construct Info: Pipeline Alignments!

>We will dive into pipelines in depth soon, don't sweat it!

*Excerpt: [TLV Spec Sheet](https://makerchip.com/) via Makerchip IDE!*

*"<<2, >>3, and <>0 are examples of pipeline alignments. They are used in references to
specify the numeric pipestage of the reference relative to the assignment's stage scope. For
references within a pipeline, << is used to reference a pipesignal of a transaction that is behind
the transaction of the assignment statement. Likewise, >> is used to reference ahead. A
natural or zero alignment is assumed for references within a pipeline (into a pipeline by the
same name) if no alignment is specified. For cross-pipeline references, the terms “ahead” and
“behind” have less meaning, but the operators are used just the same to indicate a relative
numeric stage offset, and an explicit alignment is required."*

In this instance we make use of the above construct to help implement our fibonacci logic effortlessly!

```verilog
\TLV
   $reset = *reset;
   
   //...
   
   // Assert these to end simulation (before Makerchip cycle limit).
   $fiboout[15:0] = $reset? 1 : >>1$fiboout + >>2$fiboout;
```


<img width="419" alt="4" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/ca69586a-20ae-42a1-8993-f865469bdb57">



<img width="463" alt="4wav" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/e3d10260-2ff9-4f9f-b1fc-1b6bad3de44e">


