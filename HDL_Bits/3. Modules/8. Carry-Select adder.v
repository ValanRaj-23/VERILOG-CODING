module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w0;
    wire [15:0]w1,w2;

    add16 adder1(.a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cout(w0));
    add16 adder2(.a(a[31:16]), .b(b[31:16]), .sum(w1[15:0]));
    add16 adder3(.a(a[31:16]), .b(b[31:16]), .sum(w2[15:0]), .cin(1'b1));
    mux1 m1( .i0(w1), .i1(w2), .s(w0), .y(sum[31:16]));

endmodule

 module mux1(input [15:0]i0,i1,s,output [15:0]y);
 assign y = s ? i1 : i0;
 endmodule