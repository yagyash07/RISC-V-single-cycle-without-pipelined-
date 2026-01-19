`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 04:32:50 AM
// Design Name: 
// Module Name: mux_3_return
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


module mux_3_return(  
    input  [31:0] alu_result,
    input  [31:0] mem_result,
    input  [31:0] pc_plus4,
    input  [1:0]  ResultSrc,
    output reg [31:0] writeback
);
    always @(*) begin
        case (ResultSrc)
            2'b00: writeback = alu_result;
            2'b01: writeback = mem_result;
            2'b10: writeback = pc_plus4;
            default: writeback = alu_result;
        endcase
    end
endmodule
