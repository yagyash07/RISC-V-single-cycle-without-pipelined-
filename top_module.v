`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 04:47:43 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
input clk,reset
    );
    //PC
    wire[31:0] PC_out;
    wire[31:0] PC_target;
    wire[31:0]pcplus_4_2;
   
   
   adder add(
   .in(PC_out),
   .out(pcplus_4_2));
   
    
    //instruction
    wire[31:0] instruction;
    
    //register
    wire[31:0] rd1;
    wire[31:0] rd2;
    
    //extend
    wire[31:0] immediate;
    
    //alu
    wire [31:0] B;
    wire [31:0] ALU_out;
    wire ZeroE;
     
    //data memory
    wire [31:0] mem_data;
    wire[31:0] result; // will be used in register
    
    //control unit
    wire        regwrite;
    wire        Alusrc;
    wire        branch;
    wire        jump;
    wire        memwrite;
    wire [3:0]  ALUctrl;
    wire [1:0]  ResultSrc;
    wire [2:0]  Immsrc;
    
    
    program_counter PC(
    .clk(clk),
    .reset(reset),
    .PC_in(PC_target),
    .PC_out(PC_out));
    
    instruc_mem instru_memory(
    .rd_addr(PC_out),
    .ints_out(instruction));
    
    register regi(
    .reset(reset),
    .clk(clk),
    .en(regwrite),
    .rr1(instruction[19:15]),
    .rr2(instruction[24:20]),
    .wr(instruction[11:7]),
    .write_data(result),
    .rd1(rd1),
    .rd2(rd2));
    
    control_unit ctrlu(
    .instruction(instruction),
    .regwrite(regwrite),
    .Alusrc(Alusrc),
    .branch(branch),
    .jump(jump),
    .memwrite(memwrite),
    .ALUctrl(ALUctrl),
    .ResultSrc(ResultSrc),
    .Immsrc(Immsrc));
    
    ALU alu(
    .rd1(rd1),
    .rd2(B),
    .ALUctrl(ALUctrl),
    .ALUout(ALU_out),
    .ZeroE(ZeroE));

    
    alu_src_mux mux1(
    .rd2(rd2),
    .immediate(immediate),
    .ALUsrc(Alusrc),
    .alu_result(B));
    
    mux_3_return mux2(
    .alu_result(ALU_out),
    .mem_result(mem_data),
    .pc_plus4(pcplus_4_2),
    .ResultSrc(ResultSrc),
    .writeback(result));
    
    data_memory data(
    .ALU_out(ALU_out),
    .clk(clk),
    .rd2(rd2),
    .memwrite(memwrite),
    .readdata(mem_data));
    
    pc_next pc_main(
    .immediate(immediate),
    .PC_out(PC_out),
    .branch(branch),
    .jump(jump),
    .ZeroE(ZeroE),
    .PC_target(PC_target));

    
    immediate_generator uut(
    .instruction(instruction),
    .ImmSrc(Immsrc),
    .immediate(immediate));
    
endmodule
