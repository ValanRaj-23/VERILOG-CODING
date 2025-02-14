module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter [3:0] IDLE = 0,
    				START = 1,
    				SEQ_1 = 2,
    				SEQ_10 = 3,
    				SEQ_101 = 4,
    				NSEQ = 5,
    				WAIT = 6,
    				WIN = 7,
    				FAIL = 8;
    
    reg [3:0] present, next;
    
    always@(*)
        case(present)
            IDLE 	: next <= START;
            START 	: next = SEQ_1; // f= 1
            SEQ_1 	: next = x 	? SEQ_10 : SEQ_1;
            SEQ_10 	: next = ~x ? SEQ_101 : SEQ_10;
            SEQ_101	: next = x 	? NSEQ 	: SEQ_1; // NSEQ == PRESENT G =1;
            NSEQ 	: next = y 	? WIN 	: WAIT;
            WAIT 	: next = y 	? WIN	: FAIL;
            WIN 	: next = (~resetn)  ? IDLE : WIN;
            FAIL 	: next = (~resetn)  ? IDLE : FAIL;
        endcase
    
    always@(posedge clk)begin
        if(!resetn) present <= IDLE;
    else present <= next;
    end

  assign f = (present == START);
  assign g = (present == NSEQ) || (present == WAIT) || (present == WIN);

endmodule
