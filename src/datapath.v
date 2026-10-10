
module datapath (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       u,
    input  wire       v,
    output wire [3:0] Y,
    output wire       flag_comb
);

    wire [4:0] sum_ext;
    wire [3:0] diff;
    wire [3:0] xor_result;
    wire [3:0] max_result;

    assign sum_ext = {1'b0, A} + {1'b0, B};
    assign diff = A - B;
    assign xor_result = A ^ B;
    assign max_result = (A >= B) ? A : B;

    // Selector: {v,u}
    // 00 = RESTA
    // 01 = MAYOR
    // 10 = XOR
    // 11 = SUMA

    assign Y = (v == 1'b0 && u == 1'b0) ? diff :
               (v == 1'b0 && u == 1'b1) ? max_result :
               (v == 1'b1 && u == 1'b0) ? xor_result :
                                           sum_ext[3:0];

    assign flag_comb =
               (v == 1'b0 && u == 1'b0) ? (A < B) :
               (v == 1'b0 && u == 1'b1) ? (A == B) :
               (v == 1'b1 && u == 1'b0) ? (^xor_result) :
                                           sum_ext[4];

endmodule
