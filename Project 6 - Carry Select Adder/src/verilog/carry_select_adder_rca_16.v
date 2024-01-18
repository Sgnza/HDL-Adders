`include "../../../Utils/Multiplexer/src/verilog/and_gate.v"
`include "../../../Utils/Multiplexer/src/verilog/or_gate.v"
`include "../../../Utils/Multiplexer/src/verilog/not_gate.v"
`include "../../../Utils/Multiplexer/src/verilog/multiplexer_2to1.v"
`include "../../../Utils/Multiplexer/src/verilog/multiplexer_10to5.v"
`include "../../../Project 1 - Half Adder/src/verilog/half_adder.v"
`include "../../../Project 2 - Full Adder/src/verilog/full_adder.v"
`include "../../../Project 3 - Ripple Carry Adder/src/verilog/ripple_carry_adder_4.v"
`include "carry_select_adder_4_block.v"
module carry_select_adder_rca_16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire cin,
    output wire [15:0] sum,
    output wire cout
);

wire rca40_cout, csla4b0_cout, csla4b1_cout, csla4b2_cout;
wire [3:0] rca40_sum, csla4b0_sum, csla4b1_sum, csla4b2_sum;
ripple_carry_adder_4 rca40(
    .a(a[3:0]),
    .b(b[3:0]),
    .cin(cin),
    .cout(rca40_cout),
    .sum(rca40_sum)
);

carry_select_adder_4_block csla4b0(
    .select(rca40_cout),
    .a(a[7:4]),
    .b(b[7:4]),
    .sum(csla4b0_sum),
    .cout(csla4b0_cout)
);

carry_select_adder_4_block csla4b1(
    .select(csla4b0_cout),
    .a(a[11:8]),
    .b(b[11:8]),
    .sum(csla4b1_sum),
    .cout(csla4b1_cout)
);

carry_select_adder_4_block csla4b2(
    .select(csla4b1_cout),
    .a(a[15:12]),
    .b(b[15:12]),
    .sum(csla4b2_sum),
    .cout(csla4b2_cout)
);

assign cout = csla4b2_cout;
assign sum = {csla4b2_sum, csla4b1_sum, csla4b0_sum, rca40_sum};

endmodule