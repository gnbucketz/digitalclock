`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 05:59:31 PM
// Design Name: 
// Module Name: decoder7
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

module decoder7(
    input [3:0] in,
    output reg [6:0] segment //BCD number 7 segments
    );
    
    always @(in)
    begin
    case (in)
    0: segment=7'b0000001; 
    1: segment=7'b1001111;
2: segment=7'b0010010;
        3: segment=7'b0000110;
        4: segment=7'b1001100;
        5: segment=7'b0100100;
        6: segment=7'b0100010;
        7: segment=7'b0001111;
        8: segment=7'b0000010;
        9: segment=7'b0001100;
        endcase
        end
    
    
    
endmodule
