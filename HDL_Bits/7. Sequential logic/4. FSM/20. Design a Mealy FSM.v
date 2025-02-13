module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter [1:0] S1 = 1, S2 = 2, S3 = 3;
    reg [1:0]state, next_state;
    
    always@(*)begin
        case(state)
  				S1 : next_state = x ? S2 : S1;
            	S2 : next_state = x ? S2 : S3;
            	S3 : next_state = x ? S2 : S1;
        endcase
    end
    
    always@(posedge clk or negedge aresetn)begin
        if(!aresetn) state = S1;
    else state <= next_state;
    end
    
    assign z = (state == S3) && (x == 1);
    
endmodule
