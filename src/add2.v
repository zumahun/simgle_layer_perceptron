module add2(A, B, S);
    input   [3:0] A;
    input   [1:0] B;
    output  [3:0] S;

    assign S =  (B == 2'b01) ? A + 4'b0001 :
                (B == 2'b11) ? A + 4'b1111 : 
                A;
endmodule