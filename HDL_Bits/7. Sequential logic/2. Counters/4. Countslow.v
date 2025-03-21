module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always@(posedge clk)
        if(reset) q <=  0;
     	else begin
            if((q == 9) && (slowena == 1)) q <= 0;
            else if(slowena == 1) q <= q + 1'b1;
            else q <= q;
        end
endmodule
