module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_high,
    output wire [7:0] out_low);
    assign out_high = in[15:8];
    assign out_low  = in[7:0];
endmodule