module mul2(A, B, P);
    input         A;
    input   [1:0] B;
    output  [1:0] P;

    assign P = (A == 1'b1) ? B : 0;
endmodule