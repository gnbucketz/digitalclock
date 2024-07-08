`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2024 12:45:15 AM
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
    input clk,
    input sw,
    input btnC,
    input btnU,
    input btnR,
    output [6:0] seg,
    output [3:0] an,
    output [7:0] led
    );
    
    wire [3:0] s1, s2, m1, m2, h1, h2;
    reg hrup, minup;
    wire btnCclr, btnUclr, btnRclr;
    reg btnCclr_prev, btnUclr_prev, btnRclr_prev;
    
    button dbC(.clk(clk), .btn(btnC), .clr(btnCclr));
    button dbU(.clk(clk), .btn(btnU), .clr(btnUclr));
    button dbR(.clk(clk), .btn(btnR), .clr(btnRclr));
    
    driver7 drv(.clk(clk), .clr(1'b0), .in1(h2), .in2(h1), .in3(m2), .in4(m1), .seg(seg), .an(an));
    clock clk_inst(.clk(clk), .en(sw), .rst(btnCclr), .hrup(hrup), .minup(minup), .s1(s1), .s2(s2), .m1(m1), .m2(m2), .h1(h1), .h2(h2));
    
    always @(posedge clk)
    begin
        btnUclr_prev <= btnUclr; // hrup
        btnRclr_prev <= btnRclr; // minup
        
        if (btnUclr_prev == 1'b0 && btnUclr == 1'b1)
            hrup <= 1'b1;
        else
            hrup <= 1'b0;

        if (btnRclr_prev == 1'b0 && btnRclr == 1'b1)
            minup <= 1'b1;
        else
            minup <= 1'b0;
    end
    
endmodule
