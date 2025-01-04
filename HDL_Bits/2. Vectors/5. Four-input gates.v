module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
   and and1(out_and, in[3], in[2], in[1], in[0]);
   or or1(out_or, in[3], in[2], in[1], in[0]);
   xor xor1(out_xor, in[3], in[2], in[1], in[0]);
endmodule