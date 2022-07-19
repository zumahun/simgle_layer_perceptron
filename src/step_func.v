module step_func(x, y);
    input [5:0] x;
    output      y;

    assign y = ~(x[5] || (x == 6'd0));

endmodule