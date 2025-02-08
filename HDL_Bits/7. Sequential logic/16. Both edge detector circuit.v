module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]temp_reg_a;

    always@(posedge clk)begin
        temp_reg_a <= in;
    	anyedge <= temp_reg_a ^ in;     
    end
    
endmodule
