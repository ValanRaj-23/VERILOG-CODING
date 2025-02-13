module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter S1 = 0, S2 = 1;
    reg state, next_state;
    
    always@(*)
        case(state)
            S1 : if(x)begin
                next_state = S2;
            		z = 1;
            end
            else begin
                next_state = S1;
                z = 0;
            end
            
            S2 : begin
                next_state = S2;
                z =  x ? 0 : 1;
                end
        endcase
    
    always@(posedge clk or posedge areset)begin
                if(areset) state <= S1;
            else state <= next_state;
    end
endmodule
