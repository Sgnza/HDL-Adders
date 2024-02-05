`timescale 1ps/1ps
`include "../../../../Project 1 - Half Adder/src/verilog/half_adder.v"
`include "../../../../Project 2 - Full Adder/src/verilog/full_adder.v"
`include "../../../src/verilog/8 bits/ripple_carry_adder_8.v"
module ripple_carry_adder_8_tb;

reg [7:0] a_tb;
reg [7:0] b_tb;
reg cin_tb;
wire [7:0] sum_tb;
wire cout_tb;

ripple_carry_adder_8 rca0(
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(sum_tb),
    .cout(cout_tb)
);

task verify;
    input [7:0] a_task;
    input [7:0] b_task;
    input cin_task;
    input [7:0] sum_task;
    input cout_task;

    begin
        a_tb = a_task;
        b_tb = b_task;
        cin_tb = cin_task;
        #1;
        if(sum_task == sum_tb && cout_task == cout_tb) begin
            $display("CORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de entrada cin: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, cin_task, sum_task, sum_tb, cout_task, cout_tb);
        end else begin
            $display("INCORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de entrada cin: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, cin_task, sum_task, sum_tb, cout_task, cout_tb);

        end
    end

endtask

initial begin
  $dumpfile("ripple_carry_adder_8_tb.vcd");
  $dumpvars(0, ripple_carry_adder_8_tb);
end

initial begin

verify(
    8'b1111_1111,
    8'b0000_0001,
    1'b0,
    8'b0000_0000,
    1'b1
);

end

endmodule