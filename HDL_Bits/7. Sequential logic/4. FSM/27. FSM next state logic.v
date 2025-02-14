module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    parameter [3:1] A = 0, B = 1, C = 2, D = 3,
    				E = 4, F = 5;
    reg [3:1] next_state;
    
    always@(*)begin
        case(y)
            A : next_state = w ? A : B;
            B : next_state = w ? D : C;
            C : next_state = w ? D : E;
            D : next_state = w ? A : F;
            E : next_state = w ? D : E;
            F : next_state = w ? D : C;
        endcase
    end
    
    assign Y2 = next_state[2];

endmodule
