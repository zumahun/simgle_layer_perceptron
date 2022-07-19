module register(CLK, D, Q);
    parameter ini = 4'b0000;

    input       CLK;
    input       [3:0] D;
    output      [3:0] Q;

    reg         [3:0] q;

    initial q <= ini;

    always @(posedge CLK) begin
        q <= D;    
    end

    assign Q = q;
endmodule