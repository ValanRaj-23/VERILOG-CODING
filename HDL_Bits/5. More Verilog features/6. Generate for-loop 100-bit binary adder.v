module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    always@ (*)
        begin        
        for(int i=0; i<=99; i++)
            begin
                if (i == 0)
                    begin
                        sum[i] = (a[i] ^ b[i]) ^ cin;
                        cout[i] = (a[i] & b[i]) | (b[i] & cin) | (cin & a[i]);
                    end
                else
                    begin
                        sum[i] = (a[i] ^ b[i]) ^ cout[i-1];
                        cout[i] = (a[i] & b[i]) | (b[i] & cout[i-1]) | (cout[i-1] & a[i]);
                    end
            end
        end
endmodule
