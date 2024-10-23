`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 18:04:57
// Design Name: 
// Module Name: decoder_7segment
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


module decoder_7segment(
    input [3:0] in,
    output reg [6:0] seg
    );
    
    always@(in) begin
    case(in)
        0: seg=7'b0000001; //active low logic
        1: seg=7'b1001111;
        2: seg=7'b0010010;
        3: seg=7'b0000110;
        4: seg=7'b1001100;
        5: seg=7'b0100100;
        6: seg=7'b0100000;
        7: seg=7'b0001111;
        8: seg=7'b0000000;
        9: seg=7'b0001100;
    endcase
    end
endmodule
