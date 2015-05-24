`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:31:10 05/24/2015
// Design Name:   mux2x32
// Module Name:   /home/fan/code/test/SCCPU/testmux32.v
// Project Name:  SCCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux2x32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmux32;

	// Inputs
	reg [31:0] a0;
	reg [31:0] a1;
	reg s;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	mux2x32 uut (
		.a0(a0), 
		.a1(a1), 
		.s(s), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a0 = 10;
		a1 = 32;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
      s = 1;
		#100;
		s = 0;
		// Add stimulus here

	end
      
endmodule

