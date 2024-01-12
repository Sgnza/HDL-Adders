module half_adder(
    input logic a,
    input logic b,
    output logic s,
    output logic c
);

assign s = a ^ b;
assign c = a * b;

endmodule