module top_module (
    input clk,
    input reset,  
    input x,
    output z
);
    parameter [2:0] A = 1, B = 2, C = 3, D = 4, E =5;
    reg [2:0] state, next_state;
    
    always@(*)begin
        case(state)
            A : next_state = x ? B : A;
            B : next_state = x ? E : B;
            C : next_state = x ? B : C;
            D : next_state = x ? C : B;
            E : next_state = x ? E : D;
        endcase
    end
    
    always@(posedge clk)begin
        if(reset) state <= A;
    else state <= next_state;
    end
    
    assign z = (state == D) || (state == E);
    
endmodule
