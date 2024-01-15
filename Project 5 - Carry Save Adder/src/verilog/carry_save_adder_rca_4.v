module carry_save_adder_rca_4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire [3:0] c,
    output wire [4:0] sum,
    output wire cout
);

wire [3:0] csl40_sum, csl40_cout;

carry_save_logic_4 csl40(
    .a(),
    .b(),
    .c(),
    .sum(csl40_sum),
    .cout(csl40_cout)
);

endmodule