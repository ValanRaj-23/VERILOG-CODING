module top_module ();
    reg clk;
    reg reset;
    reg t;
    wire q;

    tff uut(clk, reset, t, q);
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1'b0;
        #3;
        reset = 1'b1;
        #10;
        reset = 1'b0;   
    end
    

        
    always@(*)
        begin
            if(reset) t = 1'b0;
        	else t = 1'b1;
    	end

endmodule
