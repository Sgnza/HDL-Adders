module full_adder(
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

wire ha0_sum;
wire ha0_cout;

half_adder ha0(
    .a(a),
    .b(b),
    .sum(ha0_sum),
    .cout(ha0_cout)
);

wire ha1_cout;

half_adder hf1(
    .a(cin),
    .b(ha0_sum),
    .sum(sum),
    .cout(ha1_cout)
);

assign cout = ha1_cout | ha0_cout;

endmodule