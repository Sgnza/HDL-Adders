`timescale 1ps/1ps
`include "../../src/verilog/and_gate.v"
`include "../../src/verilog/or_gate.v"
`include "../../src/verilog/not_gate.v"
`include "../../src/verilog/multiplexer_2to1.v"
module multiplexer_2to1_tb;

reg in0_tb;
reg in1_tb;
reg select_tb;
wire channel_out_tb;

multiplexer_2to1 m0(
    .in0(in0_tb),
    .in1(in1_tb),
    .select(select_tb),
    .channel_out(channel_out_tb)
);

task verify;
    input in0_task;
    input in1_task;
    input select_task;
    input channel_out_task;

    begin
        in0_tb = in0_task;
        in1_tb = in1_task;
        select_tb = select_task;
        #1;
        if(channel_out_task == channel_out_tb) begin
            $display("CORRECTO: in0: %b, in1: %b, select: %b, channel_out esperado: %b, channel_out obtenido: %b", in0_task, in1_task, select_task, channel_out_task, channel_out_tb);
        end else begin
            $display("CORRECTO: in0: %b, in1: %b, select: %b, channel_out esperado: %b, channel_out obtenido: %b", in0_task, in1_task, select_task, channel_out_task, channel_out_tb);
        end
    end

endtask

initial begin
  $dumpfile("multiplexer_2to1_tb.vcd");
  $dumpvars(0, multiplexer_2to1_tb);
end

initial begin

verify(
    1'b1,
    1'b0,
    1'b0,
    1'b1
);

verify(
    1'b1,
    1'b0,
    1'b1,
    1'b0
);

end

endmodule