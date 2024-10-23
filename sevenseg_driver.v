`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 18:32:44
// Design Name: 
// Module Name: sevenseg_driver
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


module sevenseg_driver(
    input clk,
    input clr,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    output reg [6:0] seg,
    output reg [3:0] en
    );
    
    wire [6:0] seg1, seg2, seg3, seg4; //each goes to each segment
    reg [13:0] segclk; //goes upto 8192(0-8191), after this it resets itself
    
    parameter left=2'b00, midleft=2'b01, midright=2'b10, right=2'b11;
    reg [1:0] state = left;
    
    always@(posedge clk)
        segclk <= segclk+1'b1; //counter increments by 1
        
    always@(posedge segclk[12] or posedge clr) begin
        if(clr==1) begin
            seg<=7'b0000000;
            en<=4'b0000;
            state<=left;
        end
        else begin
            case(state)
                left: begin
                seg<=seg1;
                en<=4'b0111;
                state<=midleft;
                end
                midleft: begin
                seg<=seg2;
                en<=4'b1011;
                state<=midright;
                end
                midright: begin
                seg<=seg3;
                en<=4'b1101;
                state<=right;
                end
                right: begin
                seg<=seg4;
                en<=4'b1110;
                state<=left;
                end
            endcase
        end
    end
    
    decoder_7segment disp1(in1, seg1);
    decoder_7segment disp2(in2, seg2);
    decoder_7segment disp3(in3, seg3);
    decoder_7segment disp4(in4, seg4);
endmodule
