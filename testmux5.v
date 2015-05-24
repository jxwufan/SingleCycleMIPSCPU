`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:32:14 05/24/2015
// Design Name:   mux2x5
// Module Name:   /home/fan/code/test/SCCPU/testmux5.v
// Project Name:  SCCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux2x5
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmux5;

	// Inputs
	reg [4:0] a0;
	reg [4:0] a1;
	reg s;

	// Outputs
	wire [4:0] y;

	// Instantiate the Unit Under Test (UUT)
	mux2x5 uut (
		.a0(a0), 
		.a1(a1), 
		.s(s), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a0 = 5;
		a1 = 12;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		s = 1;
		#100;
		s = 0;
	end
      
endmodule

