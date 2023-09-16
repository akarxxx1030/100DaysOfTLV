## Sequential Logic Extended, It's time to flex some Pythogorean Logic!
Hey there! You've made it past Day 4! Safe to say that basic logic building takes a notch higher in this day as we look to extend our sequential knowledge by adding to the fundamentals covered so far. 🍾

#### Short Recap ⏪
> Fibonacci Implementation on TLV emphasizing on pipeline alignments! 👀
Feel free to visit [Day4.md](https://github.com/akarxxx1030/100DaysOfTLV/blob/main/Day4/Day4.md) to pick up and let's get started.
## Pythagorean Flex, onwards!
Before we do dive in to the implementation, here's a small recap on what the theorem throws light on!
>Pythagoras' theorem, the cornerstone of geometry, asserts that in any right triangle, the square of the length of the hypotenuse (the side opposite the right angle) is equal to the sum of the squares of the other two sides.
<img width="199" alt="sqrt" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/4edc9588-b1e5-4a9d-9eab-34d700ce6571">

>TLV's SV Library allows for the instantiation of "sqrt.v" which allows us to utilise the notion of perform a rooting operation!

We incorporate the "pipelined stage" feature that Transaction Level Verilog provides us with. As each stage goes ahead, we perform a subset of the theorem's set of actions.
> Squaring the Inputs!


> Adding the squared inputs!



> Square-Rooting the sum procured!


Flops are assumed at the junctions! *Remember?* 👀

```verilog
\TLV  
   |pythagoras
      @1
         $aa[15:0] = $a[7:0] ** 2;
         $bb[15:0] = $b[7:0] ** 2;
      @2
         $cc[15:0] = $aa + $bb;
      @3
         $c[7:0] = sqrt($cc);
```

<img width="412" alt="5" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/4bf2c36c-4156-42ba-8f03-784dc100d753">
<img width="464" alt="5wav" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/78a51529-8e31-457d-b654-918295b76dc8">



