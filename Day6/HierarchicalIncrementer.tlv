\m4_TLV_version 1d: tl-x.org
\SV

   // ===========
   // Incrementer, with a twist!
   // ===========


   m4_makerchip_module
\TLV
   m4_define(M4_WIDTH, 8)
   
   // The incrementer
   /slice[M4_WIDTH-1:0]
      // Get carry in from previous slice (or 1 into slice 0).
      $carry = (#slice == 0) ? 1'b1
                                : /slice[(#slice - 1) % M4_WIDTH]$carryo;
!     $Value <= *reset ? 1'b0    // reset to zero
                       : $Value ^ $carry;
      $carryo = $Value && $carry;
   
   // Combine output bits into a vector.
   $value[M4_WIDTH-1:0] = /slice[*]$Value;
   
   
\SV
   endmodule
