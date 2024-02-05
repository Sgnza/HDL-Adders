module index(
    input wire [15:0] in,
    output wire [3:0] out0,
    output wire [3:0] out1,
    output wire [3:0] out2,
    output wire [3:0] out3
);

assign out0 = in[3:0];
assign out1 = in[7:4];
assign out2 = in[11:8];
assign out3 = in[15:12];

endmodule