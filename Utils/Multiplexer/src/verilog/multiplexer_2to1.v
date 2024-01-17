module multiplexer_2to1(
    input wire in0,
    input wire in1,
    input wire select,
    output wire channel_out
);

wire ng0_result;
not_gate ng0(.a(select), .result(ng0_result));

wire ag0_result, ag1_result;
and_gate ag0(.a(in0), .b(ng0_result), .result(ag0_result));
and_gate ag1(.a(in1), .b(select), .result(ag1_result));

wire og0_result;
or_gate og0(.a(ag0_result), .b(ag1_result), .result(og0_result));

assign channel_out = og0_result;

endmodule