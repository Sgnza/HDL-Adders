module carry_select_adder_rca_4_block(
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

wire [4:0] m0_in0, m0_in1, m0_channel_out;

assign m0_in0 = {rca40_cout, rca40_sum};
assign m0_in1 = {rca41_cout, rca41_sum};

multiplexer_10to5 m0(
    .select(select),
    .in0(m0_in0),
    .in1(m0_in1),
    .channel_out(m0_channel_out)
);

assign sum = m0_channel_out[3:0];
assign cout = m0_channel_out[4];

endmodule