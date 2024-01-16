module carry_save_logic_4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire [3:0] c,
    output wire [3:0] sum,
    output wire [3:0] cout
);

full_adder fa0(.a(a[0]), .b(b[0]), .cin(c[0]), .sum(sum[0]), .cout(cout[0]));
full_adder fa1(.a(a[1]), .b(b[1]), .cin(c[1]), .sum(sum[1]), .cout(cout[1]));
full_adder fa2(.a(a[2]), .b(b[2]), .cin(c[2]), .sum(sum[2]), .cout(cout[2]));
full_adder fa3(.a(a[3]), .b(b[3]), .cin(c[3]), .sum(sum[3]), .cout(cout[3]));

endmodule