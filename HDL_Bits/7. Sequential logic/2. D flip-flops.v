module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);

    genvar i;
   generate
       for(i = 0; i < 8; i= i+1)
           begin : flip_flop_instances
               d_ff f1( clk, d[i], q[i]);
           end
   endgenerate
endmodule


module d_ff(
    input clk,   
    input d,
    output reg q );

    always@(posedge clk)
        begin
            q <= d;
        end       

endmodule
