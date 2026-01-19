`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2026 03:32:31 PM
// Design Name: 
// Module Name: testbench_tb
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

`timescale 1ns/1ps

module testbench_tb;

    reg clk;
    reg reset;

    // DUT
    top_module dut (
        .clk(clk),
        .reset(reset)
    );

    // CLOCK: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // RESET
    initial begin
        reset = 1;
        #20;
        reset = 0;
    end

    // END SIM
    initial begin
        #200;
        $finish;
    end

endmodule

