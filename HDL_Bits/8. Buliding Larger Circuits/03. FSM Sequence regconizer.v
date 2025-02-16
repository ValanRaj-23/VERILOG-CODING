module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    parameter [3:0] A = 1, B = 2, C = 3 , D = 4, E = 5;  
    reg [3:0] PRESENT ,NEXT;
    
   // STATE LOGIC 
    always@(*)
        case(PRESENT)
            A : NEXT = data ? B : A;
            B : NEXT = data ? C : A;
            C : NEXT = data ? C : D;
            D : NEXT = data ? E : A;
            E : NEXT = reset ? A : E;
        endcase
    
    // FF
    always@(posedge clk)
        if(reset) PRESENT <= A;
    else PRESENT <= NEXT;

    // OUTPUT
    assign start_shifting = (PRESENT == E);

endmodule
