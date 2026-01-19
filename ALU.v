`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 03:08:26 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
input [31:0] rd1,rd2,
input [3:0] ALUctrl,
output reg [31:0] ALUout,
output ZeroE
    );
    
    always @(*) begin
    case(ALUctrl)
    4'b0000 : ALUout= rd1+rd2;
    4'b0001 : ALUout= rd1-rd2;
    4'b0010 : ALUout= rd1&rd2;
    4'b0011 : ALUout= rd1|rd2;
    default: ALUout=32'b0;
    endcase
    end
    
    assign ZeroE=(ALUout==32'b0)?1:0;
    
    
    
    
endmodule
