module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter [2:0] A = 0, B = 1, C = 2, D = 3, E = 4;
    reg [2:0] OUT;
    
    always@(*)begin
        case(y)
            A : OUT = x ? B : A;
            B : OUT = x ? E : B;
            C : OUT = x ? B : C;
            D : OUT = x ? C : B;
            E : OUT = x ? E : D;
        endcase
    end
    
    assign Y0 = OUT[0];
    assign z = (y == D) || (y == E); 

    
endmodule
