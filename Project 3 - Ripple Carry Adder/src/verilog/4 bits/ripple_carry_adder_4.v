module ripple_carry_adder_4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire cout,
    output wire [3:0] sum
);

wire fa0_cout;
wire fa0_sum;
wire fa1_cout;
wire fa1_sum;
wire fa2_cout;
wire fa2_sum;
wire fa3_cout;
wire fa3_sum;

full_adder fa0(
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .sum(fa0_sum),
    .cout(fa0_cout)
);

full_adder fa1(
    .a(a[1]),
    .b(b[1]),
    .cin(fa0_cout),
    .sum(fa1_sum),
    .cout(fa1_cout)
);

full_adder fa2(
    .a(a[2]),
    .b(b[2]),
    .cin(fa1_cout),
    .sum(fa2_sum),
    .cout(fa2_cout)
);

full_adder fa3(
    .a(a[3]),
    .b(b[3]),
    .cin(fa2_cout),
    .sum(fa3_sum),
    .cout(fa3_cout)
);

assign cout = fa3_cout;
assign sum = {fa3_sum, fa2_sum, fa1_sum, fa0_sum};

endmodule