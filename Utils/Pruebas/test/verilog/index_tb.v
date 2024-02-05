`include "../../src/verilog/index.v"
module index_tb;

reg clk_tb;
reg [15:0] in_tb;
wire [3:0] out0_tb;
wire [3:0] out1_tb;
wire [3:0] out2_tb;
wire [3:0] out3_tb;

index d0(
    .in(in_tb),
    .out0(out0_tb),
    .out1(out1_tb),
    .out2(out2_tb),
    .out3(out3_tb)
);

task verify;
    input [15:0] in_task;
    input [3:0] out0_task;
    input [3:0] out1_task;
    input [3:0] out2_task;
    input [3:0] out3_task;

    begin
        in_tb = in_task;
        #1;
        if(out0_task == out0_tb && out1_task == out1_tb && out2_task == out2_tb && out3_task == out3_tb) begin
            $display("CORRECTO: in: %b, out0 obtenido: %b, out1 obtenido: %b, out2 obtenido: %b, out3 obtenido: %b", in_tb, out0_tb, out1_tb, out2_tb, out3_tb);
        end else begin
            $display("INCORRECTO: in: %b, out0 obtenido: %b, out1 obtenido: %b, out2 obtenido: %b, out3 obtenido: %b", in_tb, out0_tb, out1_tb, out2_tb, out3_tb);
        end
    end

endtask

initial begin
  $dumpfile("index_tb.vcd");
  $dumpvars(0, index_tb);
end

initial begin

verify(
    16'b1100_0011_1111_1111,
    4'b1111,
    4'b1111,
    4'b0011,
    4'b1100
);

verify(
    16'b1100001111111111,
    4'b0000,
    4'b0000,
    4'b0000,
    4'b0000
);

#100;
$finish;

end

endmodule