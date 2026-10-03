module addition #(
    parameter int unsigned WIDTH = 8
) (
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] sum,
    output logic             carry_out
);
    logic [WIDTH:0] full_sum;

    assign full_sum = {1'b0, a} + {1'b0, b};
    assign {carry_out, sum} = full_sum;
endmodule
