// Pragnya_2023102067 
`timescale 1ns / 1ps

module cla (
    input wire clk,
    input wire cin,
    input wire [3:0] x,
    input wire [3:0] y,
    output wire cout,
    output wire [3:0] z);
   
    wire [3:0] p, g, k;
    wire [3:0] n, l;
    wire [3:0] xor_z;
    wire cout_internal, po, go;
   
    assign p[0] = ~(x[0] | y[0]);
    assign g[0] = x[0] & y[0];
    assign k[0] = x[0] ^ y[0];

    assign p[1] = ~(x[1] | y[1]);
    assign g[1] = x[1] & y[1];
    assign k[1] = x[1] ^ y[1];

    assign p[2] = ~(x[2] | y[2]);
    assign g[2] = x[2] & y[2];
    assign k[2] = x[2] ^ y[2];

    assign p[3] = ~(x[3] | y[3]);
    assign g[3] = x[3] & y[3];
    assign k[3] = x[3] ^ y[3];

    assign n[0] = ~(~cin & ~g[0]);
    assign l[0] = ~(~cin | ~p[0]);

    assign n[1] = ~(~l[0] & ~g[1]);
    assign l[1] = ~(~l[0] | ~p[1]);

    assign n[2] = ~(~l[1] & ~g[2]);
    assign l[2] = ~(~l[1] | ~p[2]);

    assign n[3] = ~(~l[2] & ~g[3]);
    assign l[3] = ~(~l[2] | ~p[3]);

    assign xor_z[0] = cin ^ k[0];
    assign xor_z[1] = n[0] ^ k[1];
    assign xor_z[2] = n[1] ^ k[2];
    assign xor_z[3] = n[2] ^ k[3];
   
    assign po = ~(&l);
    assign go = ~(~l[3] & ~n[3]);
    assign cout_internal = go | (~((po)+(~k)));
  
    reg [3:0] z_reg;
    reg cout_reg;

    always @(posedge clk) begin
        z_reg <= xor_z;
        cout_reg <= cout_internal;
    end
   
    assign z = z_reg;
    assign cout = cout_reg;

endmodule
