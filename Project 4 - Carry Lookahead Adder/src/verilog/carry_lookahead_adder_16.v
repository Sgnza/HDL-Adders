module carry_lookahead_adder_16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire cin,
    output wire cout,
    output wire [15:0] sum,
    output wire P,
    output wire G
);

wire cla40_cout, cla40_P, cla40_G;
wire cla41_cout, cla41_P, cla41_G;
wire cla42_cout, cla42_P, cla42_G;
wire cla43_cout, cla43_P, cla43_G;
wire [3:0] cla40_sum, cla41_sum, cla42_sum, cla43_sum;

carry_lookahead_adder_4 cla40(
    .a(a[3:0]),
    .b(b[3:0]),
    .cin(cin),
    .cout(cla40_cout),
    .sum(cla40_sum),
    .P(cla40_P),
    .G(cla40_G)
);

carry_lookahead_adder_4 cla41(
    .a(a[7:4]),
    .b(b[7:4]),
    .cin(c40_c[0]),
    .cout(cla41_cout),
    .sum(cla41_sum),
    .P(cla41_P),
    .G(cla41_G)
);

carry_lookahead_adder_4 cla42(
    .a(a[11:8]),
    .b(b[11:8]),
    .cin(c40_c[1]),
    .cout(cla41_cout),
    .sum(cla42_sum),
    .P(cla42_P),
    .G(cla42_G)
);

carry_lookahead_adder_4 cla43(
    .a(a[15:12]),
    .b(b[15:12]),
    .cin(c40_c[2]),
    .cout(cla43_cout),
    .sum(cla43_sum),
    .P(cla43_P),
    .G(cla43_G)
);

wire [3:0] c40_p_in, c40_g_in, c40_c_in;
wire [3:0] c40_p, c40_g, c40_c;
wire c40_P, c40_G;

assign c40_p_in = {cla43_P, cla42_P, cla41_P, cla40_P};
assign c40_g_in = {cla43_G, cla42_G, cla41_G, cla40_G};

// gp_logic_4 gp40(
//     .a(c40_p_in),
//     .b(c40_g_in),
//     .p(c40_p),
//     .g(c40_g)
// );

c_logic_4 c40(
    .g(c40_g_in),
    .p(c40_p_in),
    .cin(cin),
    .c(c40_c),
    .P(c40_P),
    .G(c40_G)
);

assign cout = c40_c[3];
assign sum = {cla43_sum, cla42_sum, cla41_sum, cla40_sum};
assign P = c40_P;
assign G = c40_G;

endmodule