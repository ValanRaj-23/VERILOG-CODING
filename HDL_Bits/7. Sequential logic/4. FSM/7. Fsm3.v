module top_module(
    input clk,
    input in,
    input areset,
    output out); 

    parameter A = 0, B = 1, C = 2, D = 3;
    reg [3:0] state ,next_state;
    
    always@(posedge clk , posedge areset)
        begin
        if(areset) state <= A;
    	else state <= next_state;
        end
    
    always@(*)begin
        case(state)
            A : next_state <= in ? B : A;
            B : next_state <= in ? B : C;
            C : next_state <= in ? D : A;
            D : next_state <= in ? B : C;
        endcase
    end
    
    assign out = (state == D);

endmodule
