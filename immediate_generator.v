`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2026 02:24:38 AM
// Design Name: 
// Module Name: immediate_generator
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


module immediate_generator(
input [31:0] instruction,
input[2:0] ImmSrc,
output reg [31:0] immediate


    );
    always @(*) begin
    case(ImmSrc)
    3'b000 : immediate= {{20{instruction[31]}},instruction[31:20]}; // I
    3'b001 : immediate= {{20{instruction[31]}},instruction[31:25],instruction[11:7]}; //S
    3'b010 : immediate= {{19{instruction[31]}},instruction[31],instruction[7],instruction[30:25],instruction[11:8],1'b0}; //B
    3'b011: immediate= {{instruction[31:12]},12'b0}; //U
    3'b111: immediate= {{11{instruction[31]}},instruction[31],instruction[19:12],instruction[20],instruction[30:21],1'b0}; //J
    default : immediate=32'b0;
    endcase
    end
    
    
endmodule
