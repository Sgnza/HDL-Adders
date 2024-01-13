`include "../../src/verilog/ripple_carry_adder_4.v"

module ripple_carry_adder_8(
    input wire [7:0] a,
    input wire [7:0] b,
    input wire cin,
    output wire cout,
    output wire [7:0] sum
);

wire rca40_cout;
wire [3:0] rca40_sum;
wire rca41_cout;
wire [3:0] rca41_sum;

ripple_carry_adder_4 rca40(
    .a(a[3:0]),
    .b(b[3:0]),
    .cin(cin),
    .cout(rca40_cout),
    .sum(rca40_sum)
);
ripple_carry_adder_4 rca41(
    .a(a[7:4]),
    .b(b[7:4]),
    .cin(rca40_cout),
    .cout(rca41_cout),
    .sum(rca41_sum)
);

assign cout = rca41_cout;
assign sum = {rca41_sum, rca40_sum};

endmodule