module top_module (input x, input y, output z);

    wire z1, z2, z3, z4;
    wire g1,g2;
    
    //Positional Association
    Circuit_A IA1( x, y, z1 );
    Circuit_B IB1( x, y, z2 );
    or G0(g1, z1, z2);
    
    //Naming Associaton
    Circuit_A IA2( .x(x), .y(y), .z(z3));
    Circuit_B IB2( .x(x), .y(y), .z(z4));
    and G1(g2, z1, z2);
    
    xor G2(z, g1,g2);
    
endmodule

// Circuit A
module Circuit_A(input x, input y, output z);
        assign z = (x^y) & x;     
endmodule

// Circuit B
module Circuit_B( input x, input y, output z );    
    xnor G0(z, x, y);
endmodule

