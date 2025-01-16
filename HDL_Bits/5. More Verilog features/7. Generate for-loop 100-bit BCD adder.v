module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0]cr;
    
    genvar i;
    bcd_fadd FA(.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(cr[0]));
    
    generate
            for(i=4; i<=399; i=i+4)
                begin : bcd_adder_instances
                    bcd_fadd FA(.a(a[i+3:i]), .b(b[i+3:i]), .cin(cr[i/4-1]), .sum(sum[i+3:i]), .cout(cr[i/4]));
                end            
    endgenerate
    
    assign cout = cr[99];
    
endmodule