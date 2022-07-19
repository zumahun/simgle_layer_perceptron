module comp(A, B, D);
    input A, B;
    output [1:0] D;

    /*
        A | B |   D
        0 | 0 |  2'b00
        0 | 1 |  2'b11
        1 | 0 |  2'b01
        1 | 1 |  2'b00
    */
    assign D = {(!A) & B, A ^ B};

endmodule