## Combinatorial Logic Extended - Day 2
---
Hey there! You've made it past Day 1! Safe to say that basic logic building takes a notch higher in this day as we look to combat combinatorial examples adding to the fundamentals covered so far. 🍾

#### Short Recap ⏪
> Logic Gates encompassing AND, OR, NOT, XOR, XNOR and various extensions.
Feel free to visit [Day1.md](https://github.com/akarxxx1030/100DaysOfTLV/blob/main/Day1/Day1.md) to pick up and let's get started.

Exercise 1: Building a Half-Adder
---
A | B | Sum | Carry
---|---|---|---
0  |  0   |     0 | 0
0  |  1   |     1 | 0
1  |  0   |     1 | 0
1  |  1   |     0 | 1

`SUM = A XOR B`
`CARRY = A AND B`

```verilog
//half-adder
   $sum = $aa ^ $bb;
   $carry = $aa && $bb;
```

Exercise 2: Building a Full-Adder
---
A | B | C | Sum | Carry
---|---|---|---|---
0  |  0   | 0 |  0 | 0
0  |  0   | 1 |  1 | 0
0  |  1   | 0 |  1 | 0
0  |  1   | 1 |  0 | 1
1  |  0   | 0 |  1 | 0
1  |  0   | 1 |  0 | 1
1  |  1   | 0 |  0 | 1
1  |  1   | 1 |  1 | 1

`SUM = A XOR B XOR C`
`CARRY = (A XOR B) AND C OR (A AND B)`


```verilog
 //full-adder
   $sum1 = $aa1 ^ $bb1 ^ $cc1;
   $carry1 = ($aa1 ^ $bb1)&& $cc1 || ($aa1 && $bb1);
```

Exercise 3: Building a Half-Subtractor
---
A | B | Difference | Borrow
---|---|---|---
0  |  0   |     0 | 0
0  |  1   |     1 | 0
1  |  0   |     1 | 0
1  |  1   |     0 | 1

`DIFFERENCE = A XOR B`
`BORROW = (NOT A) AND B`

```verilog
//half-subtractor
   $diff = $aa2 ^ $bb2;
   $borr = !$aa2 && $bb2;
```

Exercise 4: Building a 2:1 Multiplexer
---
A | B | Signal | Output
---|---|---|---
1 | 0 | 0 | 1
1 | 0 | 1 | 0

`Signal HIGH? Input 2 🟢
 Signal LOW? Input 1 🔴`

 ```verilog
//2:1multiplexer
   $output = $signal? $in1:$in2;
```

Exercise 5: Building a 4:1 Multiplexer
---
>Hierarchical Approach is adopted in this particular example.

 ```verilog
//4:1multiplexer
   $output1 = $signal1? $input1:$input2;
   $output2 = $signal2? $input3:$input4;
   $output = $signal3? $output1:$output2;
```



<img width="101" alt="2" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/9caec348-b296-4a66-9739-1e37e40ce2f4">
<img width="511" alt="2wav" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/7b57cbc6-3db0-46e6-80cd-0690a73cb7ad">

