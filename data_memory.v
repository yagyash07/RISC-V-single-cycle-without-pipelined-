`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 03:50:57 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input [31:0] ALU_out,
input clk,
input [31:0] rd2,
input memwrite,
output[31:0] readdata


    );
    integer i;
initial begin
    for (i = 0; i < 64; i = i + 1)
        mem[i] = 32'b0;
end

    reg [31:0] mem[63:0];
    //store
    always @(posedge clk) begin
    if(memwrite) begin
    mem[ALU_out[7:2]]<=rd2;
    end
    end
     
    //LOAD
    assign readdata=mem[ALU_out[7:2]];
    
    
    
endmodule
