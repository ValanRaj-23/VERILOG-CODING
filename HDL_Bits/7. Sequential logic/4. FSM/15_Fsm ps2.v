module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter [1:0] B1= 0, B2 = 1, B3 = 2, FINISH = 3;
    reg [1:0] state, next_state;
    
    // State transition logic (combinational)
    always@(*)begin
        case(state)
            B1 : if(in[3] == 1) next_state = B2;
            else next_state = B1;
            B2 : next_state = B3;
            B3 : next_state = FINISH;
            FINISH : if(in[3] == 1) next_state = B2;
            else next_state = B1;
        endcase
    end
          
    // State flip-flops (sequential)
    always@(posedge clk)
        if(reset) state <= B1;
    else state <= next_state;
    
    // Output logic
    assign done = (state == FINISH);
endmodule
