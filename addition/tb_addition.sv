module tb_addition;
    localparam int unsigned WIDTH = 4;
    localparam int unsigned INPUTCOUNT = 1 << WIDTH;

    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] b;
    logic [WIDTH-1:0] sum;
    logic carry_out;
    logic [WIDTH:0] expected;

    addition #(
        .WIDTH(WIDTH)
    ) dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        $dumpfile("addition.vcd");
        $dumpvars(0, tb_addition);

        for (int unsigned a_value = 0; a_value < INPUTCOUNT; a_value++) begin
            for (int unsigned b_value = 0; b_value < INPUTCOUNT; b_value++) begin
                a = a_value[WIDTH-1:0];
                b = b_value[WIDTH-1:0];
                expected = {1'b0, a} + {1'b0, b};
                #1;

                if ({carry_out, sum} !== expected) begin
                    $fatal(1, "a=%0d b=%0d: expected %0d, got %0d",
                           a_value, b_value, expected, {carry_out, sum});
                end
            end
        end

        $display("PASS: checked all %0d input pairs.", INPUTCOUNT * INPUTCOUNT);
        $finish;
    end
endmodule
