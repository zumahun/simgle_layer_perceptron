module add1(A, B, C, S);
    input   [3:0] A, B, C;
    output  [5:0] S;

    wire    [5:0] a_ex;
    wire    [5:0] b_ex;
    wire    [5:0] c_ex;

    assign a_ex = {A[3], A[3], A};
    assign b_ex = {B[3], B[3], B};
    assign c_ex = {C[3], C[3], C};

    assign S = a_ex + b_ex + c_ex;

endmodule