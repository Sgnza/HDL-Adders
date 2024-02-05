module carry_select_adder_rca_16_sqrt(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire cin,
    output wire [15:0] sum,
    output wire cout
);

wire rca20_cout, csla_rcaN20_cout, csla_rcaN21_cout, csla_rcaN40_cout, csla_rcaN50_cout;
ripple_carry_adder_N #(.N(2)) rca20 (.a(a[1:0]), .b(b[1:0]), .cin(cin), .sum(sum[1:0]), .cout(rca20_cout));
carry_select_adder_rca_N_block #(.N(2)) csla_rcaN20(.select(rca20_cout), .a(a[3:2]), .b(b[3:2]), .sum(sum[3:2]), .cout(csla_rcaN20_cout));
carry_select_adder_rca_N_block #(.N(3)) csla_rcaN21(.select(csla_rcaN20_cout), .a(a[6:4]), .b(b[6:4]), .sum(sum[6:4]), .cout(csla_rcaN21_cout));
carry_select_adder_rca_N_block #(.N(4)) csla_rcaN40(.select(csla_rcaN21_cout), .a(a[10:7]), .b(b[10:7]), .sum(sum[10:7]), .cout(csla_rcaN40_cout));
carry_select_adder_rca_N_block #(.N(5)) csla_rcaN50(.select(csla_rcaN40_cout), .a(a[15:11]), .b(b[15:11]), .sum(sum[15:11]), .cout(csla_rcaN50_cout));

assign cout = csla_rcaN50_cout;

endmodule