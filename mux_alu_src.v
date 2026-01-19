`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 04:30:24 AM
// Design Name: 
// Module Name: mux_alu_src
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


module alu_src_mux (
    input  [31:0] rd2,
    input  [31:0] immediate,
    input ALUsrc,
    output [31:0] alu_result
);
    assign alu_result = ALUsrc ? immediate : rd2;
endmodule

