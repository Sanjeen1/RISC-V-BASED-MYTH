\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   |calc
      @1
         $sum [31 :0] = $val1 [31:0] + $val2 [31:0];
         $diff [31 :0] = $val1 [31:0] - $val2 [31:0];
         $prod [31 :0] = $val1 [31:0] * $val2 [31:0];
         $quot[31 :0] = $val1 [31:0] / $val2 [31:0];
         $cn[1:0] = $reset ? 1'd0 : (>>1$cnt + 1'd1) ;
      @2
          $out[31:0] = $op[1:0] == 2'b00 ? $sum[31:0] :
                      $op[1:0] == 2'b01 ? $diff[31:0] :
                      $op[1:0] == 2'b10 ? $prod[31:0] :
                      $quot[31:0];
         $out_rs[31:0] = ($reset & !$valid) ? 32'b0 : (>>2$out[31:0] + $val2[31:0]);
         
      
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
