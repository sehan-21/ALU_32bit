`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 17:10:17
// Design Name: 
// Module Name: multiplier_32bit
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


module multiplier_32bit(
      input [31:0]a,b,
      output [31:0]result
    );
    wire [63:0]w1;
    assign w1=a*b;
    assign result=w1[31:0];
endmodule
