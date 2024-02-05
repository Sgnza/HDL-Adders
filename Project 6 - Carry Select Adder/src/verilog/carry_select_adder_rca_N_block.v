module carry_select_adder_rca_N_block
#(
    parameter N = 2
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

wire [N:0] mN0_in0, mN0_in1;
assign mN0_in0 = {rcaN0_cout, rcaN0_sum};
assign mN0_in1 = {rcaN1_cout, rcaN1_sum};
wire [N:0] mN0_sum;

multiplexer_N_2to1 #(.N(N)) mN0(
    .select(select),
    .in0(mN0_in0),
    .in1(mN0_in1),
    .channel_out(mN0_sum)
);

assign sum = mN0_sum[N-1:0];
assign cout = mN0_sum[N];

endmodule