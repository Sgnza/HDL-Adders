module carry_select_adder_4_block(
    input wire select,
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [3:0] sum,
    output wire cout
);

wire rca40_cout, rca41_cout;
wire [3:0] rca40_sum, rca41_sum;
ripple_carry_adder_4 rca40(
    .a(a),
    .b(b),
    .cin(1'b0),
    .cout(rca40_cout),
    .sum(rca40_sum)
);

ripple_carry_adder_4 rca41(
    .a(a),
    .b(b),
    .cin(1'b1),
    .cout(rca41_cout),
    .sum(rca41_sum)
);

wire m0_cout;
wire [3:0] m0_sum;
multiplexer_10to5 m0(
    .select(select),
    .cin0(rca40_cout),
    .sum0(rca40_sum),
    .cin1(rca41_cout),
    .sum1(rca41_sum),
    .cout(m0_cout),
    .sum(m0_sum)
);

assign sum = m0_sum;
assign cout = m0_cout;

endmodule