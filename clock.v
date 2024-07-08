`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 11:35:36 PM
// Design Name: 
// Module Name: clock
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

module clock(
    input clk,
    input en,
    input rst,
    input hrup,
    input minup,
    input s1,
    output [3:0] s2,
    output [3:0] m1,
    output [3:0] m2,
    output [3:0] h1,
    output [3:0] h2
    );
    
    reg [5:0] hour = 0, min = 0, sec = 0;
    integer clck = 0;
    localparam onesec = 100_000_00; 
    
    always @ (posedge clk)
    begin
        if (rst == 1'b1)
            {hour, min, sec} <= 0;
        else if (minup == 1'b1)
        begin
            if (min == 6'd59)
                min <= 0;
            else
                min <= min + 1'd1;
        end
        else if (hrup == 1'b1)
        begin
            if (hour == 6'd23)
                hour <= 0;
            else
                hour <= hour + 1'd1;
        end
        else if (en == 1'b1)
        begin
            if (clck == onesec)
            begin
                clck <= 0;
                if (sec == 6'd59)
                begin
                    sec <= 0;
                    if (min == 6'd59)
                    begin
                        min <= 0;
                        if (hour == 6'd23)
                            hour <= 0;
                        else 
                            hour <= hour + 1'd1;
                    end
                    else
                        min <= min + 1'd1;
                end
                else 
                    sec <= sec + 1'd1;
            end 
            else 
                clck <= clck + 1;
        end
    end
    
    bcdconverter sec_conv(.binary(sec), .thos(), .hund(), .tens(s2), .ones(s1));
    bcdconverter min_conv(.binary(min), .thos(), .hund(), .tens(m2), .ones(m1));
    bcdconverter hour_conv(.binary(hour), .thos(), .hund(), .tens(h2), .ones(h1));
    
endmodule
