module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    //assignment
    assign out_assign = a ^ b;
    
    //combination always logic
    always @(*)
        begin
            out_always_comb =  a ^ b;
        end
    
    //combination always clocked
    always @(posedge clk)
        begin
            if(a ^ b)
                out_always_ff = 1'b1;
            else 
                out_always_ff = 1'b0;
        end

endmodule
