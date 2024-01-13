`include "../../src/verilog/ripple_carry_adder_32.v"

module ripple_carry_adder_64(
    input wire [63:0] a,
    input wire [63:0] b,
    input wire cin,
    output wire cout,
    output wire [63:0] sum
);

wire rca320_cout;
wire [31:0] rca320_sum;
wire rca321_cout;
wire [31:0] rca321_sum;

ripple_carry_adder_32 rca320(
    .a(a[31:0]),
    .b(b[31:0]),
    .cin(cin),
    .cout(rca320_cout),
    .sum(rca320_sum)
);

ripple_carry_adder_32 rca321(
    .a(a[63:32]),
    .b(b[63:32]),
    .cin(rca320_cout),
    .cout(rca321_cout),
    .sum(rca321_sum)
);

assign cout = rca321_cout;
assign sum = {rca321_sum, rca320_sum};

endmodule