module plus_adder_4(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);

wire [4:0] tmp;

assign tmp = a + b + cin;
assign sum = tmp[3:0];
assign cout = tmp[4];

endmodule