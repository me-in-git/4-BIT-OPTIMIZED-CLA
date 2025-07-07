// Pragnya_2023102067 
`timescale 1ns / 1ps

module cla_structural_description (
    input wire clk,
    input wire cin,
    input wire [3:0] x,
    input wire [3:0] y,
    output wire cout,
    output wire [3:0] z
);
    wire [3:0] p, g, k;      
    wire [3:0] n, l;         
    wire [3:0] xor_z;        
    wire po, go;             
    wire cout_internal;      

    pgk_gen pgk0 (.p(p[0]), .g(g[0]), .k(k[0]), .x(x[0]), .y(y[0]));
    pgk_gen pgk1 (.p(p[1]), .g(g[1]), .k(k[1]), .x(x[1]), .y(y[1]));
    pgk_gen pgk2 (.p(p[2]), .g(g[2]), .k(k[2]), .x(x[2]), .y(y[2]));
    pgk_gen pgk3 (.p(p[3]), .g(g[3]), .k(k[3]), .x(x[3]), .y(y[3]));
    
    carry_logic carry0 (.n(n[0]), .l(l[0]), .cin(cin), .g(g[0]), .p(p[0]));
    carry_logic carry1 (.n(n[1]), .l(l[1]), .cin(l[0]), .g(g[1]), .p(p[1]));
    carry_logic carry2 (.n(n[2]), .l(l[2]), .cin(l[1]), .g(g[2]), .p(p[2]));
    carry_logic carry3 (.n(n[3]), .l(l[3]), .cin(l[2]), .g(g[3]), .p(p[3]));
    
    xor_sum sum0 (.xor_z(xor_z[0]), .cin(cin), .k(k[0]));
    xor_sum sum1 (.xor_z(xor_z[1]), .cin(n[0]), .k(k[1]));
    xor_sum sum2 (.xor_z(xor_z[2]), .cin(n[1]), .k(k[2]));
    xor_sum sum3 (.xor_z(xor_z[3]), .cin(n[2]), .k(k[3]));
  
    assign po = ~(&l); 
    assign go = ~(~l[3] & ~n[3]); 
    assign cout_internal = go | (~((po) + (~k[3])));

    reg [3:0] z_reg;
    reg cout_reg;

    always @(posedge clk) begin
        z_reg <= xor_z;
        cout_reg <= cout_internal;
    end

    assign z = z_reg;
    assign cout = cout_reg;

endmodule
