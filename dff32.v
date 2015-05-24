`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:35:31 05/23/2015 
// Design Name: 
// Module Name:    dff32 
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
module dff32(d, clk, clrn, q);
	input d, clk, clrn;
	output q;
	wire [31:0] d;
	reg [31:0] q;
	initial
	begin
		q <= 0;
	end
	always @ (posedge clk or posedge clrn) begin
		if (clrn == 1) q <= 0;
		else q <= d;
	end
endmodule
