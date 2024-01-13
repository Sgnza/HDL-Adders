`timescale 1ps/1ps
`include "../../src/verilog/half_adder.v"
module half_adder_tb;

reg a_tb;
reg b_tb;
wire sum_tb;
wire cout_tb;

half_adder ha0(
    .a(a_tb),
    .b(b_tb),
    .sum(sum_tb),
    .cout(cout_tb)
);

task verify;
    input a_task;
    input b_task;
    input sum_task;
    input cout_task;

    begin
        a_tb = a_task;
        b_tb = b_task;
        #1;
        if(sum_task == sum_tb && cout_task == cout_tb) begin
            $display("CORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, sum_task, sum_tb, cout_task, cout_tb);
        end else begin
            $display("INCORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, sum_task, sum_tb, cout_task, cout_tb);

        end
    end

endtask

initial begin
  $dumpfile("half_adder_tb.vcd");
  $dumpvars(0, half_adder_tb);
end

initial begin

verify(
    1'b0,
    1'b0,
    1'b0,
    1'b0
);

verify(
    1'b1,
    1'b0,
    1'b1,
    1'b0
);

verify(
    1'b0,
    1'b1,
    1'b1,
    1'b0
);

verify(
    1'b1,
    1'b1,
    1'b0,
    1'b1
);

end

endmodule