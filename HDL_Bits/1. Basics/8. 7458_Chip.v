module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	
    wire wire_a, wire_b, wire_c, wire_d;
    
    assign wire_a = p1a && p1b && p1c;
    assign wire_b = p1d && p1e && p1f;
    assign wire_c = p2a && p2b;
    assign wire_d = p2c && p2d;
    
    assign p1y = wire_a || wire_b;
    assign p2y = wire_c || wire_d;
endmodule