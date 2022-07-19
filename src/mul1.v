module mul1(A, B, P);
    input   A;
    input   [3:0] B;
    output  [3:0] P;

    assign P = (A == 1'b1) ? B : 0; 
endmodule;