`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:22:35 01/14/2020
// Design Name:   crc32_d8
// Module Name:   /home/mgwang/Desktop/CRC/SS.v
// Project Name:  CRC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: crc32_d8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SS_CRC;

	// Inputs
	reg [31:0] crc;
	reg [7:0]  data;
	reg        clk;

	// Outputs
	wire [31:0] nextcrc32_d8;

	// Instantiate the Unit Under Test (UUT)
	crc32_d8 uut (
		.crc(crc), 
		.data(data), 
		.nextcrc32_d8(nextcrc32_d8)
	);

	always @(posedge clk)begin
		crc <= nextcrc32_d8;	
	end

	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		crc = 0;
		data = 16'hff;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

