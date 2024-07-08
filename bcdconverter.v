`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 10:48:02 PM
// Design Name: 
// Module Name: bcdconverter
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


module bcdconverter(
    input [11:0] binary,
    output reg [3:0] thos,
    output reg [3:0] hund,
    output reg [3:0] tens,
    output reg [3:0] ones
    );
    
    reg [11:0] bcd_data;
    
    always @ (binary)
    begin
        bcd_data = binary;
        thos = bcd_data / 1000;
        bcd_data = bcd_data % 1000;
        hund = bcd_data / 100;
        bcd_data = bcd_data % 100;
        tens = bcd_data / 10;
        ones = bcd_data % 10;
    end
    
endmodule
