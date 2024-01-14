module gp_logic_4(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [3:0] p,
    output wire [3:0] g
);

wire p0, p1, p2, p3;
wire g0, g1, g2, g3;

// Generamos los gi y pi --> Delay = 1 gate
assign g0 = a[0] & b[0]; // AND
assign g1 = a[1] & b[1];
assign g2 = a[2] & b[2];
assign g3 = a[3] & b[3];
assign g = {g3, g2, g1, g0};

assign p0 = a[0] ^ b[0]; // XOR
assign p1 = a[1] ^ b[1];
assign p2 = a[2] ^ b[2];
assign p3 = a[3] ^ b[3];
assign p = {p3, p2, p1, p0};



endmodule