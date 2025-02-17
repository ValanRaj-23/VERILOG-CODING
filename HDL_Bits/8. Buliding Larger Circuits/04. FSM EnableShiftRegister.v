module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter [2:0] IDLE = 1, D1 = 2, D2 = 3, D3 = 4, D4 = 5;
    reg [2:0]PRESENT, NEXT;
    
    always@(*)
        case(PRESENT)
            IDLE	: NEXT = reset ? D1 : IDLE;
            D1		: NEXT = D2;
            D2		: NEXT = D3;
            D3		: NEXT = D4;
            D4		: NEXT = IDLE;
        endcase
    
    always@(posedge clk)
     PRESENT <= NEXT;
    
    
    assign shift_ena = (PRESENT == D1) || (PRESENT == D2) || (PRESENT == D3) || (PRESENT == D4);
            
endmodule
