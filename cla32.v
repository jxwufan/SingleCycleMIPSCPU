`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:19 05/23/2015 
// Design Name: 
// Module Name:    cla32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cla32(a, b, ci, s, c0);
	input [31:0] a, b;
	input ci;
	output [31:0] s;
	output c0;
	wire g_out, p_out;
	cla_32 cla(a, b, ci, g_out, p_out, s);
	assign c0 = g_out | p_out & ci;
endmodule