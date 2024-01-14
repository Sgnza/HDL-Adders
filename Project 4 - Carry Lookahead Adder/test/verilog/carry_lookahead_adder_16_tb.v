`timescale 1ps/1ps
`include "../../src/verilog/c_logic_4.v"
`include "../../src/verilog/gp_logic_4.v"
`include "../../src/verilog/carry_lookahead_adder_4.v"
`include "../../src/verilog/carry_lookahead_adder_16.v"
module carry_lookahead_adder_16_tb;

reg [15:0] a_tb;
reg [15:0] b_tb;
reg cin_tb;
wire [15:0] sum_tb;
wire cout_tb;

carry_lookahead_adder_16 rla160(
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
            $display("CORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de entrada cin: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, cin_task, sum_task, sum_tb, cout_task, cout_tb);
        end else begin
            $display("INCORRECTO: Dato de entrada a: %b, Dato de entrada b: %b, Dato de entrada cin: %b, Dato de salida s esperado: %b, Dato de salida s obtenido: %b, Dato de salida c esperado: %b, Dato de salida c obtenido: %b", a_tb, b_tb, cin_task, sum_task, sum_tb, cout_task, cout_tb);

        end
    end

endtask

initial begin
  $dumpfile("carry_lookahead_adder_16_tb.vcd");
  $dumpvars(0, carry_lookahead_adder_16_tb);
end

initial begin

verify(
    16'b0000_0000_0000_1110,
    16'b0000_0000_0000_0001,
    1'b0,
    16'b0000_0000_0000_1111,
    1'b0
);

verify(
    16'b0000_0000_0000_1111,
    16'b0000_0000_0000_0001,
    1'b0,
    16'b0000_0000_0001_0000,
    1'b0
);

verify(
    16'b0000_0000_1111_1111,
    16'b0000_0000_0000_0001,
    1'b0,
    16'b0000_0001_0000_0000,
    1'b0
);

verify(
    16'b0000_1111_1111_1111,
    16'b0000_0000_0000_0001,
    1'b0,
    16'b0001_0000_0000_0000,
    1'b0
);

verify(
    16'b1111_1111_1111_1111,
    16'b0000_0000_0000_0001,
    1'b0,
    16'b0000_000_0000_0000,
    1'b1
);

end

endmodule