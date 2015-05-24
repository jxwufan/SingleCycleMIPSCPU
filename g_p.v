`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:13:47 05/23/2015 
// Design Name: 
// Module Name:    g_p 
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
module g_p(g, p, c_in, g_out, p_out, c_out);
	input [1:0] g, p;
	input c_in;
	output g_out, p_out, c_out;
	assign g_out = g[1] | p[1] & g[0];
	assign p_out = p[1] & p[0];
	assign c_out = g[0] | p[0] & c_in;
endmodule
