`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:46:22 12/25/2019
// Design Name:   prbs_generator
// Module Name:   /home/mgwang/Desktop/FPGA-PRBS/SS_PRBS7.v
// Project Name:  FPGA-PRBS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: prbs_generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SS_PRBS_X;

	// Inputs
	reg clock;
	reg init;
	reg [3:0] type;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	prbs_generator uut (
		.clock(clock), 
		.init(init), 
		.type(type), 
		.out(out)
	);

	always #10 clock = ~clock;

	reg [31:0] p_sum;
	reg [31:0] p_begin;

	always @(posedge clock)begin
		if (init)begin
			p_sum <= 0;
			p_begin <= out;
		end else begin
			p_sum <= p_sum +1;
			if (out == p_begin && p_sum != 0)begin
				$display("%d", p_sum);
				$stop;
			end
		end
	end

	initial begin
		// Initialize Inputs
		clock = 0;
		init = 1;

		//type = 4'h0;      //PRBS7
		//type = 4'h1;      //PRBS9
		//type = 4'h2;      //PRBS10
		//type = 4'h3;      //PRBS11
		//type = 4'h4;      //PRBS15
		//type = 4'h5;      //PRBS20
		//type = 4'h6;      //PRBS23
		//type = 4'h7;      //PRBS29
		type = 4'h8;      //PRBS31

		// Wait 100 ns for global reset to finish
		#100;
		init = 0;
        
		// Add stimulus here

	end
      
endmodule

