module top_module (
    input a, b, c, d, e,
    output [24:0] out );

    wire [24:0]in1,in2;
    
    assign in1 = { {5{a}},{5{b}},{5{c}},{5{d}},{5{e}} };
    assign in2 = { {5{a,b,c,d,e}} };
    assign out = ~in1 ^ in2;
                  
endmodule
