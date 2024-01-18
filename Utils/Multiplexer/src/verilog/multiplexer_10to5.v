module multiplexer_10to5(
    input wire select,
    input wire [4:0] in0,
    input wire [4:0] in1,
    output wire [4:0] channel_out
);

multiplexer_2to1 m0(.in0(in0[0]), .in1(in1[0]), .select(select), .channel_out(channel_out[0]));
multiplexer_2to1 m1(.in0(in0[1]), .in1(in1[1]), .select(select), .channel_out(channel_out[1]));
multiplexer_2to1 m2(.in0(in0[2]), .in1(in1[2]), .select(select), .channel_out(channel_out[2]));
multiplexer_2to1 m3(.in0(in0[3]), .in1(in1[3]), .select(select), .channel_out(channel_out[3]));
multiplexer_2to1 m4(.in0(in0[4]), .in1(in1[4]), .select(select), .channel_out(channel_out[4]));

endmodule