module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    reg [7:0] temp;
 
    always@(posedge clk)
        if(enable)begin
            temp <= {temp[6:0],S};
        end
    assign Z = temp[{A, B, C}];
    
endmodule
