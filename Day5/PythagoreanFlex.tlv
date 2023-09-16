\m4_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   m4_makerchip_module
\TLV  
   |pythagoras
      @1
         $aa[15:0] = $a[7:0] ** 2;
         $bb[15:0] = $b[7:0] ** 2;
      @2
         $cc[15:0] = $aa + $bb;
      @3
         $c[7:0] = sqrt($cc);
   
\SV
   endmodule
