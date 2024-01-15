module carry_lookahead_adder_64(
    input wire [63:0] a,
    input wire [63:0] b,
    input wire cin,
    output wire cout,
    output wire [63:0] sum,
    output wire P,
    output wire G
);

wire cla160_cout, cla160_P, cla160_G;
wire cla161_cout, cla161_P, cla161_G;
wire cla162_cout, cla162_P, cla162_G;
wire cla163_cout, cla163_P, cla163_G;
wire [15:0] cla160_sum, cla161_sum, cla162_sum, cla163_sum;

carry_lookahead_adder_16 cla160(
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(cin),
    .cout(cla160_cout),
    .sum(cla160_sum),
    .P(cla160_P),
    .G(cla160_G)
);

carry_lookahead_adder_16 cla161(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(c160_c[0]),
    .cout(cla161_cout),
    .sum(cla161_sum),
    .P(cla161_P),
    .G(cla161_G)
);

carry_lookahead_adder_16 cla162(
    .a(a[47:32]),
    .b(b[47:32]),
    .cin(c160_c[1]),
    .cout(cla161_cout),
    .sum(cla162_sum),
    .P(cla162_P),
    .G(cla162_G)
);

carry_lookahead_adder_16 cla163(
    .a(a[63:48]),
    .b(b[63:48]),
    .cin(c160_c[2]),
    .cout(cla163_cout),
    .sum(cla163_sum),
    .P(cla163_P),
    .G(cla163_G)
);

wire [3:0] c160_p_in, c160_g_in, c160_c_in;
wire [3:0] c160_p, c160_g, c160_c;
wire c40_P, c40_G;

assign c160_p_in = {cla163_P, cla162_P, cla161_P, cla160_P};
assign c160_g_in = {cla163_G, cla162_G, cla161_G, cla160_G};

// gp_logic_4 gp40(
//     .a(c40_p_in),
//     .b(c40_g_in),
//     .p(c40_p),
//     .g(c40_g)
// );

c_logic_4 c160(
    .g(c160_g_in),
    .p(c160_p_in),
    .cin(cin),
    .c(c160_c),
    .P(c160_P),
    .G(c160_G)
);

assign cout = c160_c[3];
assign sum = {cla163_sum, cla162_sum, cla161_sum, cla160_sum};
assign P = c160_P;
assign G = c160_G;

endmodule