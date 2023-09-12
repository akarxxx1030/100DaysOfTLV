# Combinational Logic in Transaction-Level Verilog
## Inverter
Inverts the input logic signal and thus produces a complemented output.
### Truth Table

Input | Output
---|---
  A     |     Y
  1     |     0
  0     |     1

>TL-Verilog provides a notation '!' to help accomplish the inversion of a particular signal value.
## AND Gate
Performs bit-wise AND-ing between input signal bits.
### Truth Table

Inputs   |   Output
---|---
A    B   |     Y
0    0   |     0
0    1   |     0
1    0   |     0
1    1   |     1

>TL-Verilog provides a notation '&&' to help accomplish the inversion of a particular signal value.
## OR Gate
Performs bit-wise OR-ing between input signal bits.
### Truth Table

Inputs   |   Output
---|---
A    B   |     Y
0    0   |     0
0    1   |     1
1    0   |     1
1    1   |     1

>TL-Verilog provides a notation '||' to help accomplish the inversion of a particular signal value.
## XOR Gate
Performs bit-wise XOR-ing between input signal bits.
### Truth Table

Inputs   |   Output
A    B   |     Y
0    0   |     0
0    1   |     1
1    0   |     1
1    1   |     0

>TL-Verilog provides a notation '^' to help accomplish the inversion of a particular signal value.
## XNOR Gate
Performs bit-wise XNOR-ing between input signal bits.
### Truth Table

Inputs   |   Output
---|---
A    B   |     Y
0    0   |     1
0    1   |     0
1    0   |     0
1    1   |     1

>TL-Verilog provides a notation '!(^)' to help accomplish the inversion of a particular signal value.
---
## Code Snippet 
```verilog
\TLV
   $inverter = !$in1;
   $and = $in1 && $in2;
   $or = $in1 || $in2;
   $xor = $in1 ^ $in2;
   $xnor = !($in1 ^ $in2);
   $nand = !($in1 && $in2);
   $nor = !($in1 || $in2);
```
> TLV section breaks down the basic implementation of combinatorial logic in transaction level.
## Waveform and Block Diagram
<img width="476" alt="1wav" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/e219171b-7714-44ce-b1a5-88eb8fbae15c">
<img width="190" alt="1" src="https://github.com/akarxxx1030/100DaysOfTLV/assets/102870828/1111de69-6c70-4150-a82e-1932f8478f14">
