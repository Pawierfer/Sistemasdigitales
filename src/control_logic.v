
module control_logic (
    input  wire a,
    input  wire b,
    input  wire c,
    input  wire d,
    output wire u,
    output wire v
);

    assign u = (a & d) |
               (b & d) |
               (c & ~b);

    assign v = (a & c) |
               (a & ~d) |
               (b & ~c);

endmodule
