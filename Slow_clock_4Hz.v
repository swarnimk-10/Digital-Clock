`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 21:42:36
// Design Name: 
// Module Name: Slow_clock_4Hz
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


module Slow_clock_4Hz(
input clk_in, //input clock of Basys 3 board
output clk_out
    );
    
    reg [25:0] count = 0;
    reg clk_out;
    
    always@(posedge clk_in) begin
        count<=count+1;
        if(count == 12500000) begin
            count=0;
            clk_out<=~clk_out;
        end
    end
endmodule
