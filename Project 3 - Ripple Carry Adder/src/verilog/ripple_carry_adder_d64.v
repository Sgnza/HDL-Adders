/*
La "d" en el nombre significa que vamos a aplicar la tecnica
de la duplicacion, con esto obtenemos una mejora en el 
tiempo, pero aumenta el area y consumo.

Si queremos aplicar la tecnica de la duplicación 
sobre un sumador RCA de 64 bits, tenemos que:
	1) Dividir en dos partes de 32 bits.
	2) Duplicamos la parte mas significativa.
	3) Y en cada una de estas partes duplicadas realizamos el calculo 
    suponiendo en la parte A que el cin = 0, y en la parte B que el cin = 1.
	4) Añadimos un multiplexor cuya señar de seleccion es el 
    cout de la parte menos significativa.
*/
module ripple_carry_adder_d64(
    input wire [63:0] a,
    input wire [63:0] b,
    input wire cin,
    output wire cout,
    output wire [63:0] sum
);

wire rca320_cout;
wire [31:0] rca320_sum;
wire rca321_cout;
wire [31:0] rca321_sum;
wire rca322_cout;
wire [31:0] rca322_sum;

// LSB
ripple_carry_adder_32 rca320(
    .a(a[31:0]),
    .b(b[31:0]),
    .cin(cin),
    .cout(rca320_cout),
    .sum(rca320_sum)
);

// MSB suponiendo cin = 0
ripple_carry_adder_32 rca321(
    .a(a[63:32]),
    .b(b[63:32]),
    .cin(1'b0),
    .cout(rca321_cout),
    .sum(rca321_sum)
);

// MSB suponiendo cin = 1
ripple_carry_adder_32 rca322(
    .a(a[63:32]),
    .b(b[63:32]),
    .cin(1'b1),
    .cout(rca322_cout),
    .sum(rca322_sum)
);

endmodule