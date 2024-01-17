module multiplexer_10to5(
    input wire select,
    input wire cin0,
    input wire [3:0] sum0,
    input wire cin1,
    input wire [3:0] sum1,
    output wire cout,
    output wire [3:0] sum
);

multiplexer_2to1 m0(.in0(sum0[0]), in1(sum1[0]), .select(select), .channel_out(sum[0]));
multiplexer_2to1 m1(.in0(sum0[1]), in1(sum1[1]), .select(select), .channel_out(sum[1]));
multiplexer_2to1 m2(.in0(sum0[2]), in1(sum1[2]), .select(select), .channel_out(sum[2]));
multiplexer_2to1 m3(.in0(sum0[3]), in1(sum1[3]), .select(select), .channel_out(sum[3]));
multiplexer_2to1 m4(.in0(cin0), in1(cin1), .select(select), .channel_out(cout));

endmodule