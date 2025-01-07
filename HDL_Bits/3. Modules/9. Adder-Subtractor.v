module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]w1;
    wire w2;
    assign w1 = b^{32{sub}};
    
    add16 adder1( .a(a[15:0]), .b(w1[15:0]), .cin(sub), .sum(sum[15:0]), .cout(w2));
    add16 adder2( .a(a[31:16]), .b(w1[31:16]), .cin(w2), .sum(sum[31:16]));       

endmodule














































































































