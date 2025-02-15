module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg [3:0] temp;
    
    always@(posedge clk )begin
        if(!resetn) temp <= 0;
    	else  temp <= {temp[2:0], in};
    end
    
	assign out = temp[3];
endmodule
