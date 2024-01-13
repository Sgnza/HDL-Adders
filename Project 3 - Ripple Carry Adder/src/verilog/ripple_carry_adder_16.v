`include "../../src/verilog/ripple_carry_adder_8.v"

module ripple_carry_adder_16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire cin,
    output wire cout,
    output wire [15:0] sum
);

wire rca80_cout;
wire [7:0] rca80_sum;
wire rca81_cout;
wire [7:0] rca81_sum;

ripple_carry_adder_8 rca80(
    .a(a[7:0]),
    .b(b[7:0]),
    .cin(cin),
    .cout(rca80_cout),
    .sum(rca80_sum)
);

ripple_carry_adder_8 rca81(
    .a(a[15:8]),
    .b(b[15:8]),
    .cin(rca80_cout),
    .cout(rca81_cout),
    .sum(rca81_sum)
);

assign cout = rca81_cout;
assign sum = {rca81_sum, rca80_sum};

endmodule