`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:06 05/23/2015 
// Design Name: 
// Module Name:    shift 
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
module shift(d, sa, right, arith, sh);
	input [31:0] d;
	input [4:0] sa;
	input right, arith;
	output [31:0] sh;
	reg [31:0] sh;
	always @* begin
		if (!right) begin
			sh = d << sa;
		end else if (!arith) begin
			sh = d >> sa;
		end else begin
			sh = $signed(d) >>> sa;
		end
	end
endmodule
