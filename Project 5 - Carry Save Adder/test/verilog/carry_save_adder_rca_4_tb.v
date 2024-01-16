`timescale 1ps/1ps
`include "../../../Project 1 - Half Adder/src/verilog/half_adder.v"
`include "../../../Project 2 - Full Adder/src/verilog/full_adder.v"
`include "../../src/verilog/carry_save_logic_4.v"
`include "../../src/verilog/carry_save_adder_rca_4.v"
module carry_save_adder_rca_4_tb;

reg [3:0] a_tb;
reg [3:0] b_tb;
reg [3:0] c_tb;
wire [4:0] sum_tb;
wire cout_tb;

carry_save_adder_rca_4 csa_rca0(
    .a(a_tb),
    .b(b_tb),
    .c(c_tb),
    .sum(sum_tb),
    .cout(cout_tb)
);

task verify;
    input [3:0] a_task;
    input [3:0] b_task;
    input [3:0] c_task;
    input [4:0] sum_task;
    input cout_task;

    begin
        a_tb = a_task;
        b_tb = b_task;
        c_tb = c_task;
        #1;
        if(sum_task == sum_tb && cout_task == cout_tb) begin
            $display("CORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de entrada cin: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, c_task, sum_task, sum_tb, cout_task, cout_tb);
        end else begin
            $display("INCORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de entrada cin: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, c_task, sum_task, sum_tb, cout_task, cout_tb);

        end
    end

endtask

initial begin
  $dumpfile("carry_save_adder_rca_4_tb.vcd");
  $dumpvars(0, carry_save_adder_rca_4_tb);
end

initial begin

verify(
    4'b0001,
    4'b0001,
    4'b0001,
    4'b0011,
    1'b0
);

verify(
    4'b1111,
    4'b1111,
    4'b1111,
    4'b1101,
    1'b1
);

end

endmodule