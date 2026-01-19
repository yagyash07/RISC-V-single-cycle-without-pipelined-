`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2026 05:19:34 PM
// Design Name: 
// Module Name: register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module register (
    input clk,
    input reset,
    input en,
    input [4:0] rr1, rr2, wr,
    input [31:0] write_data,
    output reg [31:0] rd1, rd2
);

    reg [31:0] R[0:31];
    integer i;

    // ASYNCHRONOUS READ
    always @(*) begin
        rd1 = (rr1 == 0) ? 32'b0 : R[rr1];
        rd2 = (rr2 == 0) ? 32'b0 : R[rr2];
    end
   

    // SYNCHRONOUS WRITE + RESET
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1)
                R[i] <= 32'b0;
        end else if (en && wr != 0) begin
            R[wr] <= write_data;
        end
    end

endmodule
