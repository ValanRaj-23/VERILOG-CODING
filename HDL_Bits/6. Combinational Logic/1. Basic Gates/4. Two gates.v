module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    // Dataflow modelling
    wire xnor1;
    assign xnor1 = ~(in1 ^ in2);
    assign out = (in3 ^ xnor1);
    
 /*  
    //sturctural modelling
    
	wire xnor1;
    xnor x1(xnor1, in1, in2);
    xor xor1(out, in3, xnor1);

*/
endmodule
