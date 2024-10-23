`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 21:52:05
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
    input clk, //fpga clock
    input sw, //switch to enable clock
    input btnC,  //reset the clock
    input btnU,  //hour increment
    input btnR,  //min increment
    output [6:0] seg,
    output [3:0] en,
    output [7:0] led  //displaying the seconds
    );
    
    wire [3:0] s1, s2, m1, m2, h1, h2;
    reg hrup, minup;
    
    wire btnCclr, btnUclr, btnRclr;
    reg btnCclr_prev, btnUclr_prev, btnRclr_prev;
    
    //instantiate debounce
    debounce dbC(clk, btnC, btnCclr);
    debounce dbU(clk, btnU, btnUclr);
    debounce dbR(clk, btnR, btnRclr);
    
    sevenseg_driver seg7(clk, 1'b0, h2, h2, m2, m1, seg, en);
    digital_clock clock(clk, sw, btnCclr, hrup, minup, s1, s2, m1, m2, h1, h2);
    
    always@(posedge clk) begin
        btnUclr_prev<=btnUclr;
        if(btnUclr_prev==1'b0 && btnUclr==1'b1)
            hrup<=1'b1;
        else
            hrup<=1'b0;
        if(btnRclr_prev==1'b0 && btnRclr==1'b1)
            minup<=1'b1;
        else
            minup<=1'b0;
    end
    assign led[7:0] = {s2,s1};
endmodule
