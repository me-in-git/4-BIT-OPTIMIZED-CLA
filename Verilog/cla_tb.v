`timescale 1ns / 1ps

module cla_tb;
    
    reg clk;
    reg cin;
    reg [3:0] x;
    reg [3:0] y;
    wire cout;
    wire [3:0] z;

    cla uut (
        .clk(clk),
        .cin(cin),
        .x(x),
        .y(y),
        .cout(cout),
        .z(z)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    
    initial begin
        
        cin = 0;
        x = 4'b0000;
        y = 4'b0000;
        
        #10;        
        cin = 0; x = 4'b0001; y = 4'b0010; #20;
        $display("Test 1: x=%b, y=%b, cin=%b -> z=%b, cout=%b", x, y, cin, z, cout);
        
        cin = 0; x = 4'b0101; y = 4'b1010; #20;
        $display("Test 2: x=%b, y=%b, cin=%b -> z=%b, cout=%b", x, y, cin, z, cout);
        
        cin = 0; x = 4'b1111; y = 4'b1111; #20;
        $display("Test 3: x=%b, y=%b, cin=%b -> z=%b, cout=%b", x, y, cin, z, cout);
        
        cin = 0; x = 4'b1110; y = 4'b0001; #20;
        $display("Test 4: x=%b, y=%b, cin=%b -> z=%b, cout=%b", x, y, cin, z, cout);
       
        cin = 0; x = 4'b1010; y = 4'b1100; #20;
        $display("Test 5: x=%b, y=%b, cin=%b -> z=%b, cout=%b", x, y, cin, z, cout);
        
        $finish;
    end
endmodule
