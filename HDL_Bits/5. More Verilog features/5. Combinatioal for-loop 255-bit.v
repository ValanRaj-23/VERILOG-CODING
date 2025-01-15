module top_module( 
    input [254:0] in,
    output [7:0] out );
    
 	integer i; 
    always @ (*)
        begin
        out = 0;
        for (i=0; i<=254; i++)
            if (in[i] == 1'b1)
                out = out + 1'b1;
        end   
endmodule
