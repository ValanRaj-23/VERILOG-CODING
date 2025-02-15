module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q);
   

    
	always@(posedge clk)
        if(load) 
            q <= data;
    else if(ena)begin
        case(amount)
            2'b00 : q <= {q[62:0], 1'b0};
            2'b01 : q <= {q[55:0], {8{1'b0}}};
            2'b10 : begin 
                		if(q[63] == 1) q <= {1'b1, q[63:1]};
                          else q <= {1'b0, q[63:1]};
            		end
			2'b11 : begin if(q[63] == 1) q <= { 8'hff, q[63:8]};
                			else q <= {8'h00, q[63:8]};
            		end
                          endcase
 end
endmodule

 /*   always@(posedge clk)
        if(load) 
            q <= data;
    else if(ena)begin
        case(amount)
            2'b00 : q <= q << 1;
            2'b01 : q <= q << 8;
            2'b10 : begin 
                if(q[63] == 1)begin 
                    q <= q >> 1;
                    q[63] <= 1;
                end
                else 
                    q <= q >> 1
                  end
			2'b11 : begin
                if(q[63] == 1) begin
                    	q <= q >> 8;
                    q[63:57] <= 8'h11;
                			else q <= {8'h00, q[63:8]};
            end
                          endcase
 end
endmodule */
