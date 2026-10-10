
module top_20240736 (
    input  wire       a,
    input  wire       b,
    input  wire       c,
    input  wire       d,

    input  wire [3:0] A,
    input  wire [3:0] B,

    input  wire       clk,
    input  wire       rst,
    input  wire       en,

    output wire       u,
    output wire       v,
    output wire [3:0] Y,
    output wire       flag_comb,

    output wire [3:0] Q,
    output wire       flag_q
);

    control_logic inst_control (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .u(u),
        .v(v)
    );

    datapath inst_datapath (
        .A(A),
        .B(B),
        .u(u),
        .v(v),
        .Y(Y),
        .flag_comb(flag_comb)
    );

    result_register inst_register (
        .clk(clk),
        .rst(rst),
        .en(en),
        .Y(Y),
        .flag_comb(flag_comb),
        .Q(Q),
        .flag_q(flag_q)
    );

endmodule
