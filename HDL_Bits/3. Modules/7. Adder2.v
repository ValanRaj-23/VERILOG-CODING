module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1;

    add16  m1( .a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]),.cout(w1) );
	add16  m2( .a(a[31:16]), .b(b[31:16]), .sum(sum[31:16]),.cin(w1) );


endmodule

module add1( input a, input b, input cin,   output sum, output cout );
        wire w1, w2, w3;
        xor x1(w1, a, b);
        xor x2(sum, cin, w1);
        and a1(w2, a, b);
        and a2(w3, w1, cin);
        or or1(cout, w2, w3);
endmodule
 