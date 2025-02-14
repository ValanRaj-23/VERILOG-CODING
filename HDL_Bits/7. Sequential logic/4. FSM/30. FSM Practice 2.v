module top_module (
    input clk,
    input reset,     
    input w,
    output z);
    parameter [2:0] A = 0, B = 1, C = 2, D = 3,
    				E = 4, F = 5;
    reg [2:0] state, next_state;
    
	always@(*)begin
        case(state)
            A : next_state = (w == 0) ? A : B;
            B : next_state = (w == 0) ? D : C;
            C : next_state = (w == 0) ? D : E;
            D : next_state = (w == 0) ? A : F;
            E : next_state = (w == 0) ? D : E;
            F : next_state = (w == 0) ? D : C;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset) state <= A;
    else state <= next_state;
    end
    
    assign z = (state == E) || (state == F);

endmodule
