module circular_convolution #(
    parameter size_n = 4,
    parameter size_m = 4,
    parameter width = 8
)(
    input wire start,
    input wire clk,
    input wire reset,
    input wire signed [width-1:0] A [size_n-1:0],
    input wire signed [width-1:0] B [size_m-1:0],
    output reg signed [2*width-1:0] C [(size_m + size_n)-2:0]
);

reg signed [2*width-1:0] temp;
integer i, j;
reg signed [width-1:0] B_extend [(size_m + size_n)-1:0]; // size (size_m + size_n)-1

parameter starting = 2'b00;
parameter b_extended = 2'b01;
parameter convolved = 2'b10;
parameter ending = 2'b11;

reg [1:0] state = starting;

// Initialize output C array to zero
initial begin
    for (i = 0; i <= (size_m + size_n)-2; i = i + 1) begin
        C[i] = 0;
    end
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Asynchronous reset behavior
        for (i = 0; i <= (size_m + size_n)-2; i = i + 1) begin
            C[i] <= 0;
        end
        state <= starting;
        
        
    end else begin
    
        case (state)
        
        starting: begin
            if (start) begin
                state <= b_extended;
            end
        end

        b_extended: begin
            for (i = size_m; i <= (size_m + size_n)-1; i = i + 1) begin
                B_extend[i] <= B[i];                
            end
            // Copy B to B_extend
            for (i = 0; i <= size_m-1; i = i + 1) begin
                B_extend[i] <= 8'b0;
            end
            // Zero extend the rest
            
            state <= convolved;
        end

        convolved: begin
            // Circular convolution
            B_extend[0] <= B_extend[(size_m + size_n)-1];
            for(i = 0; i <= (size_m + size_n)-2; i = i + 1) begin
                B_extend[i+1] <= B_extend[i];
            end
            
            for (j = 0; j <= 2*size_m - 2; j = j + 1) begin
                for (i = 0; i <= size_m - 1; i = i + 1) begin
                     temp <= temp +  A[i] * B[i];             
                end
                C[j] <= temp;
            end
            
            state <= starting;
        end
        
        ending: begin
            // Optional
        end
        
        endcase
    end
end

endmodule