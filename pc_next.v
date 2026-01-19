`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 03:53:13 AM
// Design Name: 
// Module Name: pc_next
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


module pc_next(
input [31:0] immediate,
input [31:0] PC_out,
output [31:0] PC_target,
input branch,
input jump,ZeroE
    );
    wire [31:0] PCplus4;
    wire [31:0] PC_next;
    wire branchvalid;
    
    
    assign PCplus4= PC_out+32'd4;
    assign PC_next= PC_out+immediate;
    assign branchvalid=branch&ZeroE;
    
    assign PC_target=jump?PC_next:(branchvalid?PC_next:PCplus4);
   
endmodule
