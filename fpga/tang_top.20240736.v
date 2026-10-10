<CodeBlock language="verilog" editable>
module tang_top_20240736 (
    input  wire        clk,
    input  wire        rst_button,
    input  wire [12:0] sw,
    output wire [6:0]  led
);

reg [12:0] sw_meta;
reg [12:0] sw_sync;
reg rst_meta;
reg rst_sync;
wire a, b, c, d;
wire en;
wire [3:0] A, B;
wire u, v;
wire [3:0] Y, Q;
wire flag_comb, flag_q;
// Sincronizacion de los 13 interruptores
always @(posedge clk) begin
sw_meta <= sw;
sw_sync <= sw_meta;
end
// Afirmacion asincrona y liberacion sincronizada
always @(posedge clk or posedge rst_button) begin
if (rst_button) begin
rst_meta <= 1'b1;
rst_sync <= 1'b1;
end
else begin
rst_meta <= 1'b0;
rst_sync <= rst_meta;
end
end
assign en = sw_sync[12];
assign B  = sw_sync[11:8];
assign A  = sw_sync[7:4];
assign a = sw_sync[3];
assign b = sw_sync[2];
assign c = sw_sync[1];
assign d = sw_sync[0];
top_20240736 inst_top (
.a(a), .b(b), .c(c), .d(d),
.A(A), .B(B),
.clk(clk),
.rst(rst_sync),
.en(en),
.u(u), .v(v),
.Y(Y),
.flag_comb(flag_comb),
.Q(Q),
.flag_q(flag_q)
);
// led[6:0] = {v,u,flag_q,Q[3:0]}
assign led = {v, u, flag_q, Q};
endmodule
</CodeBlock>