module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter [2:0] WALK_L = 3'b000,
    				WALK_R = 3'b001,
    				FALL_L = 3'b010, 
    				FALL_R = 3'b011,
    				DIG_L = 3'b100,
   					DIG_R = 3'b101,
    				SPLASH = 3'b110;    
    reg [2:0]STATE, NEXT_STATE;
    reg [6:0] i;
    

    always@(*) begin
        case(STATE)
            WALK_L : if(ground == 1) NEXT_STATE = dig ? DIG_L : (bump_left ? WALK_R : WALK_L);
            else NEXT_STATE = FALL_L;
            WALK_R : if(ground == 1) NEXT_STATE = dig ? DIG_R : (bump_right ? WALK_L : WALK_R);
            else NEXT_STATE = FALL_R; 
            
            FALL_L : NEXT_STATE <= (ground == 1) ? ((i > 19) ? SPLASH : WALK_L ): FALL_L;
            FALL_R : NEXT_STATE <= (ground == 1) ? ((i > 19) ? SPLASH : WALK_R ): FALL_R;
            DIG_L : NEXT_STATE <= (ground == 0) ? FALL_L : DIG_L;
            DIG_R : NEXT_STATE <= (ground == 0) ? FALL_R : DIG_R;
            SPLASH : NEXT_STATE <= SPLASH;
            
        endcase
    end
    always@(posedge clk , posedge areset)begin
        if(areset) STATE <= WALK_L;
        else if(STATE == FALL_L || STATE == FALL_R)begin
            i = i + 1'b1;
            STATE <= NEXT_STATE;
        end
        else begin
            i = 1'b0;
            STATE <= NEXT_STATE;
        end
    end
            
    
    assign walk_left = (STATE == WALK_L);
    assign walk_right = (STATE == WALK_R);
    assign aaah = ((STATE == FALL_L) || (STATE == FALL_R));
    assign digging = ((STATE == DIG_L) || (STATE == DIG_R));  

endmodule
