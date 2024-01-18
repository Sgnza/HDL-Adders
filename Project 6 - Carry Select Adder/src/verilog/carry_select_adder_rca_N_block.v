module carry_select_adder_rca_N_block
#(
    parameter N = 4
)
(
    input wire select,
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    output wire [N-1:0] sum,
    output wire cout
);

wire rcaN0_cout, rcaN1_cout;
wire [N-1:0] rcaN0_sum, rcaN1_sum;

ripple_carry_adder_N #(.N(N)) rcaN0(
    .a(a),
    .b(b),
    .cin(1'b0),
    .cout(rcaN0_cout),
    .sum(rcaN0_sum)
);

ripple_carry_adder_N #(.N(N)) rca41(
    .a(a),
    .b(b),
    .cin(1'b1),
    .cout(rcaN1_cout),
    .sum(rcaN1_sum)
);
// --- multiplexer_NtoN2

wire mN0_cout;
wire [N-1:0] mN0_sum;

multiplexer_N_2to1 #(.N(N)) mN0(
    .select(select),
    .in0({rcaN0_cout, rca40_sum}),
    .in1({rcaN1_cout, rca41_sum}),
    .channel_out(mN0_sum),
    .cout(mN0_cout)
);

assign sum = mN0_sum;
assign cout = mN0_cout;

endmodule