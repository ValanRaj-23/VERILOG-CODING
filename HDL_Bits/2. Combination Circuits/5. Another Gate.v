module top_module (
    input in1,
    input in2,
    output out);
    
    wire n1;
    not G1(n1, in2);
    and G2(out, in1, n1);

endmodule
