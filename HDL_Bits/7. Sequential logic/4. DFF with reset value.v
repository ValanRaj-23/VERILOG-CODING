module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    always@(negedge clk)
        if(reset)
        begin
            q <= 8'h34;
        end       
    	else 
            begin
            q <= d;
            end 

endmodule