`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2026 03:15:28 PM
// Design Name: 
// Module Name: testbench
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


module testbench;

    reg clk;
    reg reset;

    // Instantiate DUT
    top_module dut (
        .clk(clk),
        .reset(reset)
    );

    // ======================
    // Clock generation
    // ======================
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10 ns clock period
    end

    // ======================
    // Reset sequence
    // ======================
    initial begin
        reset = 1;
        #20;
        reset = 0;
    end

    // ======================
    // Monitor key signals
    // ======================
    initial begin
        $display("TIME | PC | INSTR | rd1 | rd2 | ALUout | WB");
        $monitor(
            "%4t | %h | %h | %h | %h | %h | %h",
            $time,
            dut.PC_out,
            dut.instruction,
            dut.rd1,
            dut.rd2,
            dut.ALU_out,
            dut.result
        );
    end

    // ======================
    // Simulation control
    // ======================
    initial begin
        #200;   // run for 200 ns
        $finish;
    end

endmodule
