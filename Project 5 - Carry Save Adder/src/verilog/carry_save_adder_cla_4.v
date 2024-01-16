module carry_save_adder_cla_4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire [3:0] c,
    output wire [4:0] sum,
    output wire cout
);

wire [3:0] csl40_sum, csl40_cout;

carry_save_logic_4 csl40(
    .a(a),
    .b(b),
    .c(c),
    .sum(csl40_sum),
    .cout(csl40_cout)
);

wire cla40_G, cla40_P, cla40_cout;
wire [3:0] cla40_a_in, cla40_b_in, cla40_sum;

assign cla40_a_in = {1'b0, csl40_sum[3:1]};
assign cla40_b_in = csl40_cout;

carry_lookahead_adder_4 cla40(
    .a(cla40_a_in),
    .b(cla40_b_in),
    .cin(1'b0),
    .cout(cla40_cout),
    .sum(cla40_sum),
    .P(cla40_P),
    .G(cla40_G)
);

assign sum = {cla40_sum, csl40_sum[0]};
assign cout = cla40_cout;

endmodule