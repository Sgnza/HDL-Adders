`timescale 1ps/1ps
`include "../../src/verilog/ripple_carry_adder_4.v"
module ripple_carry_adder_4_tb;

reg [3:0] a_tb;
reg [3:0] b_tb;
reg cin_tb;
wire [3:0] sum_tb;
wire cout_tb;

ripple_carry_adder_4 rca0(
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(sum_tb),
    .cout(cout_tb)
);

task verify;
    input [3:0] a_task;
    input [3:0] b_task;
    input cin_task;
    input [3:0] sum_task;
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
  $dumpfile("ripple_carry_adder_4_tb.vcd");
  $dumpvars(0, ripple_carry_adder_4_tb);
end

initial begin

verify(
    4'b1111,
    4'b0001,
    1'b0,
    4'b0000,
    1'b1
);

end

endmodule