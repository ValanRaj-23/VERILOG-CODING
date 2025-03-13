module top_module ( );

    reg clk;
    dut uut(clk);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
endmodule
