module carry_lookahead_adder_4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire cout,
    output wire [3:0] sum,
    output wire P,
    output wire G
);

wire [3:0] c40_p, c40_g, c40_c, gp40_p, gp40_g;
wire [3:0] gp40_P, gp40_G;

gp_logic_4 gp40(
    .a(a),
    .b(b),
    .p(gp40_p),
    .g(gp40_g)
);

c_logic_4 c40(
    .g(gp40_g),
    .p(gp40_p),
    .cin(cin),
    .c(c40_c),
    .P(c40_P),
    .G(c40_G)
);

// Generamos los si --> Delay = 1 gate
assign sum[0] = cin ^ gp40_p[0];
assign sum[1] = c40_c[0] ^ gp40_p[1];
assign sum[2] = c40_c[1] ^ gp40_p[2]; 
assign sum[3] = c40_c[2] ^ gp40_p[3];
assign cout = c40_c[3];
assign P = c40_P;
assign G = c40_G;

endmodule