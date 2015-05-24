`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:35:36 05/24/2015
// Design Name:   mux4x32
// Module Name:   /home/fan/code/test/SCCPU/testmux432.v
// Project Name:  SCCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux4x32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmux432;

	// Inputs
	reg [31:0] a0;
	reg [31:0] a1;
	reg [31:0] a2;
	reg [31:0] a3;
	reg [1:0] s;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	mux4x32 uut (
		.a0(a0), 
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.s(s), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a0 = 1;
		a1 = 2;
		a2 = 3;
		a3 = 4;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#100;
		s = 1;
		#100;
		s = 2;
		#100;
		s = 3;
	end
      
endmodule

