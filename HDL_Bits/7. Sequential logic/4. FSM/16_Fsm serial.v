module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter [2:0] IDLE = 1, START = 2, RECEIVE = 3, WAIT = 4, STOP = 5;
    reg [2:0] state, next_state;
    reg [3:0] count;
    
    always@(*)
        case(state)
            IDLE : next_state = (in == 0) ? START : IDLE;
            START : next_state = RECEIVE;
            RECEIVE :if(count == 8)
                    begin
                        if(in == 1) next_state = STOP;
                        else next_state = WAIT;
                    end
            		else next_state = RECEIVE;
            WAIT : next_state = (in == 1) ? IDLE : WAIT;
            STOP : next_state = (in == 1) ? IDLE : START;
        endcase
    
    always@(posedge clk)begin
        if(reset) state <= IDLE;
    else state <= next_state;
    end
    
    always@(posedge clk)begin
        if(reset)begin
            done <= 1'b0;
            count <= 1'b0;
        end
        else if(next_state == RECEIVE)begin
            count <= count + 1'b1;
            done <= 1'b0;
        end
        else if(next_state == STOP)begin
			done <= 1'b1;
        	count <= 1'b0;
        end
        else begin 
            done <= 1'b0;
        	count <= 1'b0;
    	end
    end
endmodule
