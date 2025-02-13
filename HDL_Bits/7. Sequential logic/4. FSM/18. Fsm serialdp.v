module top_module(
    input clk,
    input in,
    input reset,    
    output [7:0] out_byte,
    output done
); 

    parameter [2:0] IDLE = 1, START = 2, RECEIVE = 3, CHECK = 4,  WAIT = 5, STOP = 6;
    reg [2:0] state, next_state;
    reg [3:0] count;
    reg [7:0] temp;
    reg parity_reset;
    reg parity_reg;
    reg odd;
    
    always@(*)
        case(state)
            IDLE 	: next_state = (in == 1) ? IDLE : START;
            START 	: next_state = RECEIVE;
            RECEIVE : next_state = (count == 8) ? CHECK : RECEIVE;
            CHECK 	: next_state = (in == 1) ? STOP : WAIT;
            WAIT 	: next_state = (in == 1) ? IDLE : WAIT;
            STOP 	: next_state = (in == 1) ? IDLE : START;
        endcase
    
    always@(posedge clk)begin
        if(reset) state <= IDLE;
    else state <= next_state;
    end
    
    always@(posedge clk)begin
        if(reset)begin
            count <= 1'b0;
        end
        else if(next_state == RECEIVE)begin
            count <= count + 1'b1;
            temp <= {in,temp[7:1]};
            end
        else if(next_state == STOP)begin
        	count <= 1'b0;
        end
        else begin 
        	count <= 1'b0;
    	end
    end
    
    parity uut( clk, reset || parity_reset, in, odd);
    
    always@(posedge clk)begin
        if(reset) parity_reg <= 0;
    else parity_reg <= odd;
    end

    always@(posedge clk)begin
        case(next_state)
            IDLE : parity_reset <= 1;
            STOP : parity_reset <= 1;
            default: parity_reset <= 0;
        endcase
    end
    
    assign done = (state == STOP) && parity_reg;
    assign out_byte = (done) ? temp : 8'h00;
endmodule

//Reference
/*module top_module(
    input clk,
    input in,
    input reset,    
    output [7:0] out_byte,
    output done
); 

    parameter [2:0] IDLE = 1, START = 2, RECEIVE = 3,  WAIT = 4, STOP = 5;
    reg [2:0] state, next_state;
    reg [3:0] count;
    reg [7:0] temp;
    reg parity_reset;
    reg parity_reg;
    reg odd;
    
    always@(*)
        case(state)
            IDLE : next_state = (in == 1) ? IDLE : START;
            START : next_state = RECEIVE;
            RECEIVE : next_state = (count == 9) ? ((in == 1) ? STOP : WAIT) : RECEIVE;
            // STAY HERE UNTILL ALL 8 BITS ARE RECEIVE AND A PARITY BIT
            WAIT : next_state = (in == 1) ? IDLE : WAIT;
            STOP : next_state = (in == 1) ? IDLE : START;
        endcase
    
    always@(posedge clk)begin
        if(reset) state <= IDLE;
    else state <= next_state;
    end
    
    always@(posedge clk)begin
        if(reset)begin
            count <= 1'b0;
        end
        else if(next_state == RECEIVE)begin
            count <= count + 1'b1;
            // INCREMENT COUNT UNTILL IT RECEIVE 8 BITS ARE RECEIVED 
            // AFTER RECEIVING ALL 8 BIT THEN PARITY BIT CHECK BUT NOT SHORTED IN THE TEMP_REG
            // BECAUSE WE ONLY NEED 8 BIT DATA AND WE SHOULD CHECK THE PARITY BIT ALSO 
            if(count < 8)begin	
            temp <= {in,temp[7:1]};
            end
        end
        else if(next_state == STOP)begin
        	count <= 1'b0;
        end
        else begin 
        	count <= 1'b0;
    	end
    end
    
    //MODULE INSTANTIATION 
    parity uut( clk, reset || parity_reset, in, odd);
    
    always@(posedge clk)begin
        if(reset) parity_reg <= 0;
    else parity_reg <= odd;
    end

    always@(posedge clk)begin
        case(next_state)
            IDLE : parity_reset <= 1; // RESET THE PARITY MODULE WHEN THE NEXT STATE IS IDLE AND STOP 
            STOP : parity_reset <= 1;// THESE ARE THE STATES WHERE WE NEED TO COMPUTE THE NEXT STREAM OF BITS
            default: parity_reset <= 0;
        endcase
    end
    
    assign done = (state == STOP) && parity_reg;
    assign out_byte = (done) ? temp : 8'h00;
endmodule */
