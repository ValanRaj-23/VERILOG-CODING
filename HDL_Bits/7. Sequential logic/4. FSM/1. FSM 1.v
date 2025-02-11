module top_module(
    input clk,
    input areset,    
    input in,
    output out);

    parameter A=0, B=1; 
    reg state, next_state;

    always@(*) begin
        case(state)
            A : next_state = in ? A : B;
            B : next_state = in ? B : A;
        endcase
    end
    always@(posedge clk , posedge areset)begin
        if(areset) state <= B;
            else state <= next_state;
                end
	assign out = (state == B);
endmodule
       // another way
   /* always @(*) begin    
        state = next_state;
    end

    always @(posedge clk, posedge areset) begin    
        if(areset)begin
            next_state <= B;
        end
        else
            begin
                case(state)
                    A : if(in) next_state <= A;
                    else next_state <= B;
                    B : if(in) next_state <= B;
                    else next_state <= A;
                endcase
            end
    end

    assign out = (state == B) ? 1 : 0;
endmodule
*/
