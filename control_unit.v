`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2026 04:07:15 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
input [31:0] instruction,
output reg regwrite,Alusrc,branch,jump,memwrite,
output reg [3:0] ALUctrl,
output reg [1:0] ResultSrc,
output reg[2:0] Immsrc

    );
    wire [6:0]opcode= instruction[6:0];
    wire [2:0] funct3 = instruction[14:12];
    wire [6:0] funct7 = instruction[31:25];
    
    always @(*) begin
    regwrite  = 0;
    Alusrc    = 0;
    memwrite  = 0;
    branch    = 0;
    jump      = 0;
    ResultSrc = 2'b00;
    Immsrc    = 3'b000;
    ALUctrl   = 4'b0000; 
    
    case(opcode) 
    7'b0110011: begin //R
    regwrite=1;
    case(funct3)
    3'b000: ALUctrl=(funct7[5]?4'b0001:4'b0000); // sub/add
    3'b111: ALUctrl=4'b0010 ;//AND
    3'b110: ALUctrl = 4'b0011; // OR
    default: ALUctrl = 4'b0000;

    endcase
    
    end
    7'b0010011: begin//I
    regwrite = 1;
    Alusrc   = 1;
    Immsrc   = 3'b000;
    case (funct3)
    3'b000: ALUctrl = 4'b0000; // ADDI
    3'b111: ALUctrl = 4'b0010; // ANDI
    3'b110: ALUctrl = 4'b0011; // ORI
    default: ALUctrl = 4'b0000;

    endcase
    end
    
    
            // LOAD
            7'b0000011: begin
                regwrite  = 1;
                Alusrc    = 1;
                ResultSrc = 2'b01;
                Immsrc    = 3'b000;
                ALUctrl   = 4'b0000;
            end

            // STORE
            7'b0100011: begin
                Alusrc   = 1;
                memwrite = 1;
                Immsrc   = 3'b001;
                ALUctrl  = 4'b0000;
            end
            
            // BRANCH (beq)
            7'b1100011: begin
                branch  = 1;
                Immsrc  = 3'b010;
                ALUctrl = 4'b0001; // SUB
            end

            // JAL
            7'b1101111: begin
                regwrite  = 1;
                jump      = 1;
                ResultSrc = 2'b10;
                Immsrc    = 3'b111;
                
            end

            // JALR
            7'b1100111: begin
                regwrite  = 1;
                jump      = 1;
                Alusrc    = 1;
                ResultSrc = 2'b10;
                Immsrc    = 3'b000;
            end

        endcase
    end
          
               
                
    
    
    

endmodule
