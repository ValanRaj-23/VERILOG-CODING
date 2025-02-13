module top_module (
    input clk,
    input areset,
    input x,
    output z); 
    
    parameter [1:0] S1 = 1, S2 = 2, S3 = 3;
    reg [1:0] state, next_state;
    
    always@(*)begin 
        case(state) 
            S1 : next_state = x ? S2 : S1;
            S2 : next_state = x ? S3 : S2;
            S3 : next_state = x ? S3 : S2;
            default: next_state = S1;
        endcase
    end
    always@(posedge clk or posedge areset)begin
        if(areset) state <= S1;
    	else state <= next_state;
    end

    assign z = (state == S2);
endmodule
