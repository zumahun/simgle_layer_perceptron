module testbench;
    reg CLK;
    reg X1, X2, S;
    wire Z;
    wire [1:0] DELTA;
    wire [3:0] W1, W2, W3;

    wire s;

    assign s = (!X1) | X2; // teacher logic "or"
    //assign s = (!X1) & X2; // teacher logic "and"

    initial begin
        $dumpfile("perceptron.vcd");
        $dumpvars(0, testbench);
        $monitor("%t | CLK:%b | X1:%b X2:%b | W1:%b W2:%b W3:%b | Z:%b | S:%b | DELTA:%b", $time, CLK, X1, X2, W1, W2, W3, Z, S, DELTA);

        CLK     <= 0;
        X1      <= 0;
        X2      <= 0;
        S       <= 0;

        #27
            $finish;
    end

    always #1
        CLK     <= ~CLK;

    always #2   begin
        X1      <= ~X1;
        S       <= s;
    end

    always #4
        X2      <= ~X2;

    perceptron perceptron(
        .CLK(CLK),
        .X1(X1),
        .X2(X2), 
        .W1(W1), 
        .W2(W2), 
        .W3(W3), 
        .Z(Z), 
        .S(S),
        .DELTA(DELTA));

endmodule