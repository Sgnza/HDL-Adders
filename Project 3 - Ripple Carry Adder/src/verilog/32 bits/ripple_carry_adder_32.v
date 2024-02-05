`include "../../src/verilog/ripple_carry_adder_16.v"

module ripple_carry_adder_32(
    input wire [31:0] a,
    input wire [31:0] b,
    input wire cin,
    output wire cout,
    output wire [31:0] sum
);

wire rca160_cout;
wire [15:0] rca160_sum;
wire rca161_cout;
wire [15:0] rca161_sum;

ripple_carry_adder_16 rca160(
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(cin),
    .cout(rca160_cout),
    .sum(rca160_sum)
);

ripple_carry_adder_16 rca161(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(rca160_cout),
    .cout(rca161_cout),
    .sum(rca161_sum)
);

assign cout = rca161_cout;
assign sum = {rca161_sum, rca160_sum};

endmodule