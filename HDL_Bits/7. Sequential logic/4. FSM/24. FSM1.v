module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter [1:0] IDLE = 2'b01, START = 2'b10;
    reg [1:0] state, next_state;
    reg [1:0] count, one;
    
    always@(*)begin
        case(state)
            IDLE : next_state = (s) ? START : IDLE;
            START : next_state = START;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset)begin 
            state <= IDLE;
            count = 0;
            one = 0;
        end
    	else begin
			state <= next_state;
            if (state == START)begin
            	if(count == 3)begin
            	count = 0;
            	one = 0;
            	end
            
            	if(w == 1)begin
            	one = one + 1'b1;
            	end
            count = count + 1'b1;
        end
    end
    end
    
    assign z = (one == 2) && (count == 3);
endmodule
