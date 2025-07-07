// Pragnya_2023102067 
module carry_logic (
    output n, l,
    input cin, g, p
);
    assign n = ~(~cin & ~g);  // Carry generate logic
    assign l = ~(~cin | ~p);  // Carry propagate logic
endmodule
