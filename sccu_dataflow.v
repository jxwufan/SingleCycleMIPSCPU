`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:46:17 05/23/2015 
// Design Name: 
// Module Name:    sccu_dataflow 
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
module sccu_dataflow(op, func, z, wmem, wreg, regrt, m2reg, aluc, shift, aluimm, pcsource, jal, sext);
	input [5:0] op, func;
	input z;
	output wreg, regrt, jal, m2reg, shift, aluimm, sext, wmem;
	output [3:0] aluc;
	output [1:0] pcsource;
	
	wire r_type = ~|op;
	wire i_add 	= r_type & func[5] &~func[4] &~func[3] &~func[2] &~func[1] &~func[0];
	wire i_sub 	= r_type & func[5] &~func[4] &~func[3] &~func[2] & func[1] &~func[0];
	wire i_and 	= r_type & func[5] &~func[4] &~func[3] & func[2] &~func[1] &~func[0];
	wire i_or 	= r_type & func[5] &~func[4] &~func[3] & func[2] &~func[1] & func[0];
	wire i_xor 	= r_type & func[5] &~func[4] &~func[3] & func[2] & func[1] &~func[0];
	wire i_sll 	= r_type &~func[5] &~func[4] &~func[3] &~func[2] &~func[1] &~func[0];
	wire i_srl 	= r_type &~func[5] &~func[4] &~func[3] &~func[2] & func[1] &~func[0];
	wire i_sra 	= r_type &~func[5] &~func[4] &~func[3] &~func[2] & func[1] & func[0];
	wire i_jr 	= r_type &~func[5] &~func[4] & func[3] &~func[2] &~func[1] &~func[0];
	wire i_nor 	= r_type & func[5] &~func[4] &~func[3] & func[2] & func[1] & func[0];
	wire i_slt 	= r_type & func[5] &~func[4] & func[3] &~func[2] & func[1] &~func[0];
	wire i_jalr = r_type &~func[5] &~func[4] & func[3] &~func[2] &~func[1] & func[0];
	wire i_addi	= ~op[5]&~op[4]& op[3]&~op[2]&~op[1]&~op[0];
	wire i_andi	= ~op[5]&~op[4]& op[3]& op[2]&~op[1]&~op[0];
	wire i_ori	= ~op[5]&~op[4]& op[3]& op[2]&~op[1]& op[0];
	wire i_xori	= ~op[5]&~op[4]& op[3]& op[2]& op[1]&~op[0];
	wire i_lw	=  op[5]&~op[4]&~op[3]&~op[2]& op[1]& op[0];
	wire i_sw	=  op[5]&~op[4]& op[3]&~op[2]& op[1]& op[0];
	wire i_beq	= ~op[5]&~op[4]&~op[3]& op[2]&~op[1]&~op[0];
	wire i_bne	= ~op[5]&~op[4]&~op[3]& op[2]&~op[1]& op[0];
	wire i_lui	= ~op[5]&~op[4]& op[3]& op[2]& op[1]& op[0];
	wire i_j		= ~op[5]&~op[4]&~op[3]&~op[2]& op[1]&~op[0];
	wire i_jal	= ~op[5]&~op[4]&~op[3]&~op[2]& op[1]& op[0];
	wire i_slti = ~op[5]&~op[4]& op[3]&~op[2]& op[1]&~op[0];
	
	assign wreg 	= i_add | i_sub | i_and | i_or | i_xor | i_sll | i_srl | i_sra | i_addi | i_andi | i_ori | i_xori | i_lw | i_lui | i_jal | i_slt | i_nor | i_slti | i_jalr;
	assign regrt	= i_addi | i_andi | i_ori | i_xori | i_lw | i_lui | i_slti;
	assign jal 		= i_jal | i_jalr;
	assign m2reg 	= i_lw;
	assign shift	= i_sll | i_srl | i_sra;
	assign aluimm	= i_addi | i_andi | i_ori | i_xori | i_lw | i_lui | i_sw | i_slti;
	assign sext 	= i_addi | i_lw | i_sw | i_beq | i_bne | i_slti;
	assign aluc[3] = i_sra | i_slt | i_nor | i_slti;
	assign aluc[2] = i_sub | i_or | i_srl | i_sra | i_ori | i_lui | i_nor;
	assign aluc[1] = i_xor | i_sll | i_srl | i_sra | i_xori | i_beq | i_bne | i_lui;
	assign aluc[0] = i_and | i_or | i_sll | i_srl | i_sra | i_andi | i_ori | i_nor;
	assign wmem 	= i_sw;
	assign pcsource[1] = i_jr | i_j | i_jal | i_jalr;
	assign pcsource[0] = i_beq&z | i_bne&~z |i_j |i_jal;
endmodule
