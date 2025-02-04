// Data flow modelling

module top_module (
    input in1,
    input in2,
    output out);
    
    wire n1;
    assign out = (in1 & (~in2));
endmodule

/*
Structural modeling

module top_module (
    input in1,
    input in2,
    output out);
    
    wire n1;
    not not1(n1,in2);
    and and1(out,in1,n1);
endmodule
*/