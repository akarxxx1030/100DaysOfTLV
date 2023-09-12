\TLV
   //$reset = *reset;
   
   //half-adder
   $sum = $aa ^ $bb;
   $carry = $aa && $bb;
   
   //full-adder
   $sum1 = $aa1 ^ $bb1 ^ $cc1;
   $carry1 = ($aa1 ^ $bb1)&& $cc1 || ($aa1 && $bb1);
   
   //half-subtractor
   $diff = $aa2 ^ $bb2;
   $borr = !$aa2 && $bb2;
   
   //2:1multiplexer
   $output = $signal? $in1:$in2;
   
   //4:1multiplexer
   $output1 = $signal1? $input1:$input2;
   $output2 = $signal2? $input3:$input4;
   $output = $signal3? $output1:$output2;
   
  
   
   
   
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
