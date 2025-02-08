module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    reg [7:0]temp_reg;
    always@(posedge clk)begin
        temp_reg <= in;
    	pedge <= ~temp_reg & in;     
    end
endmodule

