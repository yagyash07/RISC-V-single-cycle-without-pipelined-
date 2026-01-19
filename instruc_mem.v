`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2026 02:40:08 PM
// Design Name: 
// Module Name: instruc_mem
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


module instruc_mem(
    input  [31:0] rd_addr,
    output [31:0] ints_out
);

    reg [31:0] mem[0:63];

    // PROGRAM LOAD (SIMULATION ONLY)
    initial begin
    
 // I-type
    mem[0]  = 32'h00A00093; // addi x1, x0, 10
    mem[1]  = 32'h01400113; // addi x2, x0, 20

    // R-type
    mem[2]  = 32'h002081B3; // add x3, x1, x2
    mem[3]  = 32'h40110233; // sub x4, x2, x1
    mem[4]  = 32'h0020F2B3; // and x5, x1, x2
    mem[5]  = 32'h0020E333; // or  x6, x1, x2

    // Store
    mem[6]  = 32'h01000393; // addi x7, x0, 16
    mem[7]  = 32'h0033A023; // sw x3, 0(x7)
    mem[8]  = 32'h0043A223; // sw x4, 4(x7)

    // Load
    mem[9]  = 32'h0003A403; // lw x8, 0(x7)
    mem[10] = 32'h0043A483; // lw x9, 4(x7)

    // Branch taken
    mem[11] = 32'h00340463; // beq x8, x3, +8
    mem[12] = 32'h06300513; // addi x10, x0, 99 (skipped)

    // Label1
    mem[13] = 32'h03700513; // addi x10, x0, 55

    // Branch not taken
    mem[14] = 32'h00341463; // bne x8, x3, +8
    mem[15] = 32'h04D00593; // addi x11, x0, 77

    // Jump
    mem[16] = 32'h0080066F; // jal x12, +8
    mem[17] = 32'h07B00693; // addi x13, x0, 123 (skipped)

    // Label3
    mem[18] = 32'h02A00693; // addi x13, x0, 42

    // NOPs
    mem[19] = 32'h00000013;
    mem[20] = 32'h00000013;
end



    // COMBINATIONAL READ
    assign ints_out = mem[rd_addr[7:2]];

endmodule
