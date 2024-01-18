`include "../../../Project 1 - half Adder/src/verilog/half_adder.v"
`include "../../../Project 2 - Full Adder/src/verilog/full_adder.v"
module ripple_carry_adder_N
#(
    parameter N = 4
)
(
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire [N-1:0] sum,
    output wire cout
);

wire [N-2:0] cout_aux;

genvar i;
generate
    for (i = 0; i < N; i = i + 1) begin
        if(i == 0) begin
            full_adder fa0(
            .a(a[i]),
            .b(b[i]),
            .cin(cin),
            .sum(sum[i]),
            .cout(cout_aux[i])
        );
        end else if(i != 0 & i != N-1) begin
            full_adder fa0(
            .a(a[i]),
            .b(b[i]),
            .cin(cout_aux[i-1]),
            .sum(sum[i]),
            .cout(cout_aux[i])
        );
        end else begin
            full_adder fa0(
            .a(a[i]),
            .b(b[i]),
            .cin(cout_aux[i-1]),
            .sum(sum[i]),
            .cout(cout)
        );
        end

    end
endgenerate

endmodule