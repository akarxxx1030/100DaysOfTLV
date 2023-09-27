\m4_TLV_version 1d: tl-x.org
\SV

// This design computes the quotient Q = A / B, where A and B are 1-digit hexidecimal
// numbers that form a proper fraction (A < B). Q is computed to four fractional digits
// using long division, computing one digit of Q every M4_ITER cycles. Calculations
// are permitted to interleave.
//
//         A R1 R2 R3
//       / B  B  B  B
//        -- -- -- --
//      . Q1 Q2 Q3 Q4
//   ---------------
// B ) A. 0  0  0  0
//   - Q1*B
//    -----
//       R1  0
//      - Q2*B
//       -----
//          R2  0
//         - Q3*B
//
m4_makerchip_module

m4_define(M4_ITER, 3)  // Separation between iterations.
                       // >>M4_ITER = previous iteration
                       // <<M4_ITER = next iteration

\TLV
   // Long Division (M4_ITER cycles/digit)
   
   |calc
      @0
         // Carry A and B from previous iteration.
         $aa[3:0] = $in_valid ? $aa_in : >>M4_ITER$aa;
         $bb[3:0] = $in_valid ? $bb_in : >>M4_ITER$bb;
         // Valid iteration for this pipeline?
         $calc_valid = $reset ? 0 :
              $in_valid || (>>M4_ITER$calc_valid && (>>M4_ITER$iteration != 3));
         // Track which iteration we're processing, 0-3.
         $iteration[1:0] = >>M4_ITER$calc_valid ? (>>M4_ITER$iteration + 1) : 0;
      // Main calculation. Computes next hex digit of quotient (Q).
      ?$calc_valid
         
         // Remainder for this iteration, so, A, R1, R2, R3.
         @0
            $remainder[3:0] = $in_valid ? $aa : >>M4_ITER$next_remainder;
         
         // The digit of the quotient, computed in this iteration.
         @1
            $quotient_digit[3:0] = {$remainder, 4'b0} / $bb;
            // Accumulate $quotient_digit by shifting into $quotient.
            $quotient[15:0] = {>>M4_ITER$quotient[11:0], $quotient_digit};
         
         // The next value of $remainder, so R1, R2, R3, R4.
         @2
            $mul[7:0] = {4'b0, $quotient_digit} * {4'b0, $bb};
         @3
            $next_remainder[3:0] = {$remainder[3:0], 4'b0} - $mul;
            // This feeds into $remainder for the next iteration.



   // Stimulus
   |calc
      @-1
!        $reset = *reset;
      @0
         // Choose random A / B, valid if A < B (and the pipeline's not busy or in reset).
         m4_rand($rand_a, 3, 0)
         m4_rand($rand_b, 3, 0)
         // $in_valid pulses for the first iteration of the calculation.
         $in_valid = ($rand_a < $rand_b) && (! >>M4_ITER$calc_valid && (>>M4_ITER$iteration == 0)) && !$reset;
         ?$calc_valid
            $aa_in[3:0] = $in_valid ? $rand_a : $RETAIN;
            $bb_in[3:0] = $in_valid ? $rand_b : $RETAIN;


   // Checking/Output
   |calc
      @-1
         // Free-running cycle count.
         $CycCnt[15:0] <= $reset ? 16'b0 : $CycCnt + 16'b1;
      // Checking
      @0
         $last_iter = $iteration == 2'b11;
      @3
         ?$calc_valid
            $Error1 <= $remainder[3:0] >= $bb[3:0];
            $Error2 <= 0; //$quotient_digit[7:4] != 4'b0;
         // Full division, for comparison.
         ?$last_iter
            $full_quotient[19:0] = {$aa, 16'b0} / {16'b0, $bb};
            // Comparison.
            $Error3 <= $full_quotient != {4'b0, $quotient};
         
         // Print
         \SV_plus
            always_ff @(posedge clk) begin
               if ($last_iter) begin
                  \$display("Cyc: \%d, \%d / \%d = b0.\%4h (0.\%4h)", $CycCnt, $aa, $bb, $quotient, $full_quotient[15:0]);
               end
            end
      @4

         // Pass the test on cycle 40; fail on error conditions.
!        *passed = $CycCnt > 16'd40;
!        *failed = $Error1 || $Error2 || $Error3;

\SV
endmodule
