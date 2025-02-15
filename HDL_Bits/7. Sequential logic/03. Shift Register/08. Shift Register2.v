module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    MUXDFF M1(KEY[0], KEY[1], KEY[2], LEDR[1], SW[0], LEDR[0]);
    MUXDFF M2(KEY[0], KEY[1], KEY[2], LEDR[2], SW[1], LEDR[1]);
    MUXDFF M3(KEY[0], KEY[1], KEY[2], LEDR[3], SW[2], LEDR[2]);
    MUXDFF M4(KEY[0], KEY[1], KEY[2], KEY[3], SW[3], LEDR[3]);
    
endmodule

module MUXDFF(input clk, E, L, W, R,
              output Q);
    always@(posedge clk)
       begin 
           if(L)
            Q <= R;
		   else begin
               if (E) Q <= W;
               else Q <= Q;
       			end
       end
    
endmodule
