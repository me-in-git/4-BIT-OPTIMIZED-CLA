// Pragnya_2023102067 
module pgk_gen (
    output p, g, k,
    input x, y
);
    assign p = ~(x | y);  // Propagate
    assign g = x & y;     // Generate
    assign k = x ^ y;     // XOR
endmodule
