module perceptron(
        input   CLK, 
        input   X1, X2, S,
        output  [3:0] W1, W2, W3, 
        output  Z,
        output  [1:0] DELTA);

    parameter ini1 = 4'b0001; // w1 init
    parameter ini2 = 4'b0010; // w2 init
    parameter ini3 = 4'b0000; // w3 init

    wire [3:0]  w1, w2, w3, x1w1, x2w2, update_w1, update_w2, update_w3;

    wire [5:0] mac;
    wire z, s;
    wire [1:0] delta;
    wire [1:0] dw1, dw2, dw3;

    assign Z     = z;
    assign W1    = w1;
    assign W2    = w2;
    assign W3    = w3;
    assign DELTA = delta;

    mul1 mul1_1(X1, w1, x1w1);
    mul1 mul1_2(X2, w2, x2w2);

    add1 add1(x1w1, x2w2, w3, mac);

    step_func step_func(mac, z);

    register #(ini1) register_1(CLK, update_w1, w1);
    register #(ini2) register_2(CLK, update_w2, w2);
    register #(ini3) register_3(CLK, update_w3, w3);

    comp comp(S, z, delta);

    mul2 mul2_1(X1, delta, dw1);
    mul2 mul2_2(X2, delta, dw2);

    add2 add2_1(w1, dw1, update_w1);
    add2 add2_2(w2, dw2, update_w2);
    add2 add2_3(w3, delta, update_w3);
    
endmodule