module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    reg [3:0]temp = 4'h0;
    
    always@(posedge clk)
        begin
            
            if(shift_ena) 
                temp <= {temp[2:0], data};
            else if(count_ena) 
                temp <= temp - 1'b1;
        end
    assign q = temp;
 
endmodule
