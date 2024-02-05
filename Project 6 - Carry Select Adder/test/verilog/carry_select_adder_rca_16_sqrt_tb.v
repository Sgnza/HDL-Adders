`timescale 1ps/1ps
`include "../../../Project 3 - Ripple Carry Adder/src/verilog/ripple_carry_adder_N.v"
`include "../../../Utils/Multiplexer/src/verilog/and_gate.v"
`include "../../../Utils/Multiplexer/src/verilog/or_gate.v"
`include "../../../Utils/Multiplexer/src/verilog/not_gate.v"
`include "../../../Utils/Multiplexer/src/verilog/multiplexer_2to1.v"
`include "../../../Utils/Multiplexer/src/verilog/multiplexer_N_2to1.v"
`include "../../src/verilog/carry_select_adder_rca_N_block.v"
`include "../../src/verilog/carry_select_adder_rca_16_sqrt.v"
module carry_select_adder_rca_16_sqrt_tb;

reg [15:0] a_tb;
reg [15:0] b_tb;
reg cin_tb;
wire [15:0] sum_tb;
wire cout_tb;

carry_select_adder_rca_16_sqrt csla_rca160(
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(sum_tb),
    .cout(cout_tb)
);

task verify;
    input [15:0] a_task;
    input [15:0] b_task;
    input cin_task;
    input [15:0] sum_task;
    input cout_task;

    begin
        a_tb = a_task;
        b_tb = b_task;
        cin_tb = cin_task;
        #1;
        if(sum_task == sum_tb && cout_task == cout_tb) begin
            $display("CORRECTO: A: %b, B: %b, Cin: %b, Sum: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, cin_task, sum_task, sum_tb, cout_task, cout_tb);
        end else begin
            $display("INCORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de entrada cin: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, cin_task, sum_task, sum_tb, cout_task, cout_tb);

        end
    end

endtask

initial begin
  $dumpfile("carry_select_adder_rca_16_sqrt_tb.vcd");
  $dumpvars(0, carry_select_adder_rca_16_sqrt_tb);
end

initial begin

verify(
    16'b1111111111111111,
    16'b0000000000000001,
    1'b0,
    16'b0000000000000000,
    1'b1
);

end

endmodule