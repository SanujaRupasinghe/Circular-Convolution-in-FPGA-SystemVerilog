`timescale 1ns/1ps

module tb_circular_convolution;

    // Parameters
    parameter size_n = 4;
    parameter size_m = 4;
    parameter width = 8;

    // Inputs
    reg start;
    reg clk;
    reg reset;
    reg signed [width-1:0] A [size_n-1:0];
    reg signed [width-1:0] B [size_m-1:0];

    // Outputs
    wire signed [2*width-1:0] C [(size_m + size_n)-2:0];

    // Instantiate the Unit Under Test (UUT)
    circular_convolution #(size_n, size_m, width) uut (
        .start(start),
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .C(C)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Stimulus
    initial begin
        // Initialize Inputs
        reset = 1;
        start = 0;

        A[0] = 8'd1;
        A[1] = 8'd1;
        A[2] = 8'd1;
        A[3] = 8'd1;

        B[0] = 8'd1;
        B[1] = 8'd1;
        B[2] = 8'd1;
        B[3] = 8'd1;

        // Apply Reset
        #10 reset = 0;

        // Start Convolution
        #10 start = 1;

        // Wait for convolution to complete
        #100;

        // Display the result
        $display("Output C: ");
        for (integer i = 0; i < (size_m + size_n - 1); i = i + 1) begin
            $display("C[%0d] = %0d", i, C[i]);
        end

        // End simulation
        #10 $stop;
    end

endmodule
