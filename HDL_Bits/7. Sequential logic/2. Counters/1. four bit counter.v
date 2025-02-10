module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
        if(reset)
            q <= 0;
    	else begin
            if(q == 8'h16) q <= 0;
    		else q <= q + 1'b1;	
        end
endmodule
