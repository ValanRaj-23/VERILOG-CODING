module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter [1:0] IDLE = 0,
    				DEVICE1 = 1,
    				DEVICE2 = 2,
    				DEVICE3 = 3;
    reg [1:0] state;
    
    always@(posedge clk)
        if(!resetn) 
            state <= IDLE;
        else 
            case(state)
            IDLE :begin
                casex(r)
                    3'bxx1 : state = DEVICE1;
                    3'bx10 : state = DEVICE2;
                    3'b100 : state = DEVICE3;
                    default: state = IDLE;
                endcase
            end
            
            DEVICE1 : begin
                if(r[1])state = DEVICE1;
            	else state = IDLE;
            end
            
            DEVICE2 : begin
                if(r[2])state = DEVICE2;
            	else state = IDLE;
            end
 
            DEVICE3 :begin
                if(r[3]) state = DEVICE3;
            	else state = IDLE;
            end 
            endcase
    always@(*)
        casex(state)
            IDLE : g = 3'b000;
            DEVICE1 : g = 3'b001;
            DEVICE2 : g = 3'b010;
            DEVICE3 : g = 3'b100;
        endcase
            
    
  	//assign g[3] = (state == DEVICE3);
    //assign g[2] = (state == DEVICE2);
    //assign g[1] = (state == DEVICE1);
            
endmodule
