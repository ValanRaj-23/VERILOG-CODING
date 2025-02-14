module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    assign Y2 = (y[1] == 1) && ~w;
    assign Y4 = |{y[3:2], y[6:5]} && w;

// In one-hot encoding with inspection method 
//the input can be non-one hot but it should check only the required bit
endmodule
