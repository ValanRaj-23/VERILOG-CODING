module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    
    wire [7:0] min1,min2,min3;
        
    assign min1 = (a > b) ? b : a;
    assign min2 = (min1 > c) ? c : min1;
    assign min3 = (min2 > d) ? d : min2;
    assign min = min3;

endmodule