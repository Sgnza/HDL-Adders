// `include "and_gate.v"
// `include "or_gate.v"
// `include "not_gate.v"
// `include "multiplexer_2to1.v"
module multiplexer_N_2to1
#(
    parameter N = 2
)
(
    input wire select,
    input wire [N:0] in0,
    input wire [N:0] in1,
    output wire [N:0] channel_out
);

genvar i;
generate
    for (i = 0; i <= N; i = i + 1) begin
        multiplexer_2to1 m0(
            .in0(in0[i]), 
            .in1(in1[i]), 
            .select(select), 
            .channel_out(channel_out[i])
        );
    end
endgenerate

endmodule