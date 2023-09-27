\m4_TLV_version 1d: tl-x.org
\SV
   
   
   m4_makerchip_module
\TLV
   |alu
      @0
         $sum[31:0]= $input1[31:0] + $input2[31:0];
         $and[31:0] = $input1[31:0] && $input2[31:0];
         $or[31:0] = $input1[31:0] || $input2[31:0];
         $not[31:0] = !$input[31:0];
 
         

\SV
   endmodule
