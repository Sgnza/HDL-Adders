module carry_save_adder_rca_4(
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

// ripple_carry_adder_4 rca40(
//     .a(csl40_sum),
//     .b(csl40_cout),
//     .cin(0'b0),
//     .sum(sum),
//     .cout(cout)
// );

wire ha0_cout, ha0_sum, ha1_cout, ha1_sum;
wire fa0_sum, fa0_cout, fa1_sum, fa1_cout;

half_adder ha0(.a(csl40_sum[1]), .b(csl40_cout[0]), .sum(ha0_sum), .cout(ha0_cout));
full_adder fa0(.a(csl40_sum[2]), .b(csl40_cout[1]), .cin(ha0_cout), .sum(fa0_sum), .cout(fa0_cout));
full_adder fa1(.a(csl40_sum[3]), .b(csl40_cout[2]), .cin(fa0_cout), .sum(fa1_sum), .cout(fa1_cout));
half_adder ha1(.a(fa1_cout), .b(csl40_cout[3]), .sum(ha1_sum), .cout(cout));

assign sum = {ha1_sum, fa1_sum, fa0_sum, ha0_sum, csl40_sum[0]};

endmodule