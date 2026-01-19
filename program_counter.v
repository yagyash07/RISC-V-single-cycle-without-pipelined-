`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2026 02:25:24 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
input clk,
input reset,
input [31:0] PC_in,
output reg [31:0] PC_out

    );
    always @(posedge clk) begin
    if(reset) begin
    PC_out<=32'b0;
    end
    else PC_out<=PC_in;
    end
endmodule

