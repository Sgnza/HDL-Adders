module c_logic_4(
    input wire [3:0] g,
    input wire [3:0] p,
    input wire cin,
    output wire [3:0] c,
    output wire P,
    output wire G
);

wire c1, c2, c3;

// Generamos los ci --> Delay = 2 gate
assign c1 = g[0] | (p[0] & cin);
assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
assign c4 = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0] | p[3] & p[2] & p[1] & p[0] & cin;
assign c = {c4, c3, c2, c1};

// Generamos las salidas P y G

assign P = p[3] & p[2] & p[1] & p[0];
assign G = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

endmodule