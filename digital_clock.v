`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 20:58:32
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(
    input clk,
    input enable,
    input rst,
    input hrup,  //pushbutton
    input minup,  //pushbutton
    output [3:0] s1,
    output  [3:0] s2,
    output  [3:0] m1,
    output  [3:0] m2,
    output  [3:0] h1,
    output  [3:0] h2
    );
    
    //time display format: h2 h1 : m2 m1 
    reg[5:0] hour=0, min=0, sec=0; //we have taken 6 bits as min and sec can go max upto 60, so we take 6 bits(0-63).
    integer clkc=0;
    
    parameter onesec=100000000;
    always@(posedge clk) begin
        if(rst==1'b1)
            {hour,min,sec}<=0;
        else if (minup==1'b1) begin
            if(min==6'd59)
                min<=0;
            else
                min<=min+1'd1;
        end
        else if (hrup==1'b1) begin
            if(hour==6'd23)
                hour<=0;
            else
                hour<=hour+1'd1;
        end
        else if (enable==1'b1) begin
            if (clkc==onesec) begin
                clkc<=0;
                if (sec==6'd59) begin
                    sec<=0;
                    if (min==6'd59) begin
                        min<=0;
                        if (hour==6'd23)
                            hour<=0;
                        else
                            hour<=hour+1'd1;
                    end
                    else begin
                        min<=min+1'd1;
                    end
                end
                else begin
                    sec<=sec+1'd1;
                end
            end
            else begin
                clkc=clkc+1;
            end
        end
    end
    
    binarytoBCD secs(.binary(sec), .thous(), .hund(), .tens(s2), .ones(s1));
    binarytoBCD mins(.binary(min), .thous(), .hund(), .tens(m2), .ones(m1));
    binarytoBCD hours(.binary(hour), .thous(), .hund(), .tens(h2), .ones(h1));
endmodule
