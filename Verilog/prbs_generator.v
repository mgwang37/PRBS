`timescale 1ns / 1ps


module prbs_generator
(
	input             clock,
	input             init,
	input      [ 3:0] type,
	output reg [31:0] out
);

localparam  TYPE_PRBS7  = 4'b0000;
localparam  TYPE_PRBS9  = 4'b0001;
localparam  TYPE_PRBS10 = 4'b0010;
localparam  TYPE_PRBS11 = 4'b0011;
localparam  TYPE_PRBS15 = 4'b0100;
localparam  TYPE_PRBS20 = 4'b0101;
localparam  TYPE_PRBS23 = 4'b0110;
localparam  TYPE_PRBS29 = 4'b0111;
localparam  TYPE_PRBS31 = 4'b1000;


	/**************************************************/
	function [31:0] prbs7;
		input [31:0] in;
		begin
			prbs7[31] = in[6]^in[5];
			prbs7[30] = in[5]^in[4];
			prbs7[29] = in[4]^in[3];
			prbs7[28] = in[3]^in[2];
			prbs7[27] = in[2]^in[1];
			prbs7[26] = in[1]^in[0];
			prbs7[25] = in[0]^(in[6]^in[5]);
			prbs7[24] = (in[6]^in[5])^(in[5]^in[4]);
			prbs7[23] = (in[5]^in[4])^(in[4]^in[3]);
			prbs7[22] = (in[4]^in[3])^(in[3]^in[2]);
			prbs7[21] = (in[3]^in[2])^(in[2]^in[1]);
			prbs7[20] = (in[2]^in[1])^(in[1]^in[0]);
			prbs7[19] = (in[1]^in[0])^(in[0]^(in[6]^in[5]));
			prbs7[18] = (in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4]));
			prbs7[17] = ((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3]));
			prbs7[16] = ((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2]));
			prbs7[15] = ((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1]));
			prbs7[14] = ((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0]));
			prbs7[13] = ((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5])));
			prbs7[12] = ((in[1]^in[0])^(in[0]^(in[6]^in[5])))^((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])));
			prbs7[11] = ((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])))^(((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3])));
			prbs7[10] = (((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3])))^(((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2])));
			prbs7[9]  = (((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2])))^(((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1])));
			prbs7[8]  = (((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1])))^(((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0])));
			prbs7[7]  = (((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0])))^(((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5]))));
			prbs7[6]  = (((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5]))))^(((in[1]^in[0])^(in[0]^(in[6]^in[5])))^((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4]))));
			prbs7[5]  = (((in[1]^in[0])^(in[0]^(in[6]^in[5])))^((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4]))))^(((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])))^(((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3]))));
			prbs7[4]  = (((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])))^(((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3]))))^((((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3])))^(((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2]))));
			prbs7[3]  = ((((in[6]^in[5])^(in[5]^in[4]))^((in[5]^in[4])^(in[4]^in[3])))^(((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2]))))^((((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2])))^(((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1]))));
			prbs7[2]  = ((((in[5]^in[4])^(in[4]^in[3]))^((in[4]^in[3])^(in[3]^in[2])))^(((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1]))))^((((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1])))^(((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0]))));
			prbs7[1]  = ((((in[4]^in[3])^(in[3]^in[2]))^((in[3]^in[2])^(in[2]^in[1])))^(((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0]))))^((((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0])))^(((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5])))));
			prbs7[0]  = ((((in[3]^in[2])^(in[2]^in[1]))^((in[2]^in[1])^(in[1]^in[0])))^(((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5])))))^((((in[2]^in[1])^(in[1]^in[0]))^((in[1]^in[0])^(in[0]^(in[6]^in[5]))))^(((in[1]^in[0])^(in[0]^(in[6]^in[5])))^((in[0]^(in[6]^in[5]))^((in[6]^in[5])^(in[5]^in[4])))));
      end
   endfunction

	/**************************************************/
	function [31:0] prbs9;
		input [31:0] in;
		begin
			prbs9[31] = in[8]^in[4];
			prbs9[30] = in[7]^in[3];
			prbs9[29] = in[6]^in[2];
			prbs9[28] = in[5]^in[1];
			prbs9[27] = in[4]^in[0];
			prbs9[26] = in[3]^(in[8]^in[4]);
			prbs9[25] = in[2]^(in[7]^in[3]);
			prbs9[24] = in[1]^(in[6]^in[2]);
			prbs9[23] = in[0]^(in[5]^in[1]);
			prbs9[22] = (in[8]^in[4])^(in[4]^in[0]);
			prbs9[21] = (in[7]^in[3])^(in[3]^(in[8]^in[4]));
			prbs9[20] = (in[6]^in[2])^(in[2]^(in[7]^in[3]));
			prbs9[19] = (in[5]^in[1])^(in[1]^(in[6]^in[2]));
			prbs9[18] = (in[4]^in[0])^(in[0]^(in[5]^in[1]));
			prbs9[17] = (in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0]));
			prbs9[16] = (in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4])));
			prbs9[15] = (in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3])));
			prbs9[14] = (in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2])));
			prbs9[13] = ((in[8]^in[4])^(in[4]^in[0]))^((in[4]^in[0])^(in[0]^(in[5]^in[1])));
			prbs9[12] = ((in[7]^in[3])^(in[3]^(in[8]^in[4])))^((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0])));
			prbs9[11] = ((in[6]^in[2])^(in[2]^(in[7]^in[3])))^((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4]))));
			prbs9[10] = ((in[5]^in[1])^(in[1]^(in[6]^in[2])))^((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3]))));
			prbs9[9] = ((in[4]^in[0])^(in[0]^(in[5]^in[1])))^((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2]))));
			prbs9[8] = ((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0])))^(((in[8]^in[4])^(in[4]^in[0]))^((in[4]^in[0])^(in[0]^(in[5]^in[1]))));
			prbs9[7] = ((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4]))))^(((in[7]^in[3])^(in[3]^(in[8]^in[4])))^((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0]))));
			prbs9[6] = ((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3]))))^(((in[6]^in[2])^(in[2]^(in[7]^in[3])))^((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4])))));
			prbs9[5] = ((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2]))))^(((in[5]^in[1])^(in[1]^(in[6]^in[2])))^((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3])))));
			prbs9[4] = (((in[8]^in[4])^(in[4]^in[0]))^((in[4]^in[0])^(in[0]^(in[5]^in[1]))))^(((in[4]^in[0])^(in[0]^(in[5]^in[1])))^((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2])))));
			prbs9[3] = (((in[7]^in[3])^(in[3]^(in[8]^in[4])))^((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0]))))^(((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0])))^(((in[8]^in[4])^(in[4]^in[0]))^((in[4]^in[0])^(in[0]^(in[5]^in[1])))));
			prbs9[2] = (((in[6]^in[2])^(in[2]^(in[7]^in[3])))^((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4])))))^(((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4]))))^(((in[7]^in[3])^(in[3]^(in[8]^in[4])))^((in[3]^(in[8]^in[4]))^((in[8]^in[4])^(in[4]^in[0])))));
			prbs9[1] = (((in[5]^in[1])^(in[1]^(in[6]^in[2])))^((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3])))))^(((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3]))))^(((in[6]^in[2])^(in[2]^(in[7]^in[3])))^((in[2]^(in[7]^in[3]))^((in[7]^in[3])^(in[3]^(in[8]^in[4]))))));
			prbs9[0] = (((in[4]^in[0])^(in[0]^(in[5]^in[1])))^((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2])))))^(((in[0]^(in[5]^in[1]))^((in[5]^in[1])^(in[1]^(in[6]^in[2]))))^(((in[5]^in[1])^(in[1]^(in[6]^in[2])))^((in[1]^(in[6]^in[2]))^((in[6]^in[2])^(in[2]^(in[7]^in[3]))))));
      end
   endfunction

	/**************************************************/
	function [31:0] prbs10;
		input [31:0] in;
		begin
			prbs10[31] = in[9]^in[6];
			prbs10[30] = in[8]^in[5];
			prbs10[29] = in[7]^in[4];
			prbs10[28] = in[6]^in[3];
			prbs10[27] = in[5]^in[2];
			prbs10[26] = in[4]^in[1];
			prbs10[25] = in[3]^in[0];
			prbs10[24] = in[2]^(in[9]^in[6]);
			prbs10[23] = in[1]^(in[8]^in[5]);
			prbs10[22] = in[0]^(in[7]^in[4]);
			prbs10[21] = (in[9]^in[6])^(in[6]^in[3]);
			prbs10[20] = (in[8]^in[5])^(in[5]^in[2]);
			prbs10[19] = (in[7]^in[4])^(in[4]^in[1]);
			prbs10[18] = (in[6]^in[3])^(in[3]^in[0]);
			prbs10[17] = (in[5]^in[2])^(in[2]^(in[9]^in[6]));
			prbs10[16] = (in[4]^in[1])^(in[1]^(in[8]^in[5]));
			prbs10[15] = (in[3]^in[0])^(in[0]^(in[7]^in[4]));
			prbs10[14] = (in[2]^(in[9]^in[6]))^((in[9]^in[6])^(in[6]^in[3]));
			prbs10[13] = (in[1]^(in[8]^in[5]))^((in[8]^in[5])^(in[5]^in[2]));
			prbs10[12] = (in[0]^(in[7]^in[4]))^((in[7]^in[4])^(in[4]^in[1]));
			prbs10[11] = ((in[9]^in[6])^(in[6]^in[3]))^((in[6]^in[3])^(in[3]^in[0]));
			prbs10[10] = ((in[8]^in[5])^(in[5]^in[2]))^((in[5]^in[2])^(in[2]^(in[9]^in[6])));
			prbs10[9] = ((in[7]^in[4])^(in[4]^in[1]))^((in[4]^in[1])^(in[1]^(in[8]^in[5])));
			prbs10[8] = ((in[6]^in[3])^(in[3]^in[0]))^((in[3]^in[0])^(in[0]^(in[7]^in[4])));
			prbs10[7] = ((in[5]^in[2])^(in[2]^(in[9]^in[6])))^((in[2]^(in[9]^in[6]))^((in[9]^in[6])^(in[6]^in[3])));
			prbs10[6] = ((in[4]^in[1])^(in[1]^(in[8]^in[5])))^((in[1]^(in[8]^in[5]))^((in[8]^in[5])^(in[5]^in[2])));
			prbs10[5] = ((in[3]^in[0])^(in[0]^(in[7]^in[4])))^((in[0]^(in[7]^in[4]))^((in[7]^in[4])^(in[4]^in[1])));
			prbs10[4] = ((in[2]^(in[9]^in[6]))^((in[9]^in[6])^(in[6]^in[3])))^(((in[9]^in[6])^(in[6]^in[3]))^((in[6]^in[3])^(in[3]^in[0])));
			prbs10[3] = ((in[1]^(in[8]^in[5]))^((in[8]^in[5])^(in[5]^in[2])))^(((in[8]^in[5])^(in[5]^in[2]))^((in[5]^in[2])^(in[2]^(in[9]^in[6]))));
			prbs10[2] = ((in[0]^(in[7]^in[4]))^((in[7]^in[4])^(in[4]^in[1])))^(((in[7]^in[4])^(in[4]^in[1]))^((in[4]^in[1])^(in[1]^(in[8]^in[5]))));
			prbs10[1] = (((in[9]^in[6])^(in[6]^in[3]))^((in[6]^in[3])^(in[3]^in[0])))^(((in[6]^in[3])^(in[3]^in[0]))^((in[3]^in[0])^(in[0]^(in[7]^in[4]))));
			prbs10[0] = (((in[8]^in[5])^(in[5]^in[2]))^((in[5]^in[2])^(in[2]^(in[9]^in[6]))))^(((in[5]^in[2])^(in[2]^(in[9]^in[6])))^((in[2]^(in[9]^in[6]))^((in[9]^in[6])^(in[6]^in[3]))));
      end
   endfunction

	/**************************************************/
	function [31:0] prbs11;
		input [31:0] in;
		begin
			prbs11[31] = in[10] ^ in[ 8];
			prbs11[30] = in[ 9] ^ in[ 7];
			prbs11[29] = in[ 8] ^ in[ 6];
			prbs11[28] = in[ 7] ^ in[ 5];
			prbs11[27] = in[ 6] ^ in[ 4];
			prbs11[26] = in[ 5] ^ in[ 3];
			prbs11[25] = in[ 4] ^ in[ 2];
			prbs11[24] = in[ 3] ^ in[ 1];
			prbs11[23] = in[ 2] ^ in[ 0];
			prbs11[22] = in[ 1] ^ (in[10] ^ in[ 8]);
			prbs11[21] = in[ 0] ^ (in[ 9] ^ in[ 7]);
			prbs11[20] = (in[10] ^ in[ 8]) ^ (in[ 8] ^ in[ 6]);
			prbs11[19] = (in[ 9] ^ in[ 7]) ^ (in[ 7] ^ in[ 5]);
			prbs11[18] = (in[ 8] ^ in[ 6]) ^ (in[ 6] ^ in[ 4]);
			prbs11[17] = (in[ 7] ^ in[ 5]) ^ (in[ 5] ^ in[ 3]);
			prbs11[16] = (in[ 6] ^ in[ 4]) ^ (in[ 4] ^ in[ 2]);
			prbs11[15] = (in[ 5] ^ in[ 3]) ^ (in[ 3] ^ in[ 1]);
			prbs11[14] = (in[ 4] ^ in[ 2]) ^ (in[ 2] ^ in[ 0]);
			prbs11[13] = (in[ 3] ^ in[ 1]) ^ (in[ 1] ^ (in[10] ^ in[ 8]));
			prbs11[12] = (in[ 2] ^ in[ 0]) ^ (in[ 0] ^ (in[ 9] ^ in[ 7]));
			prbs11[11] = (in[ 1] ^ (in[10] ^ in[ 8])) ^ ((in[10] ^ in[ 8]) ^ (in[ 8] ^ in[ 6]));
			prbs11[10] = (in[ 0] ^ (in[ 9] ^ in[ 7])) ^ ((in[ 9] ^ in[ 7]) ^ (in[ 7] ^ in[ 5]));
			prbs11[ 9] = ((in[10] ^ in[ 8]) ^ (in[ 8] ^ in[ 6])) ^ ((in[ 8] ^ in[ 6]) ^ (in[ 6] ^ in[ 4]));
			prbs11[ 8] = ((in[ 9] ^ in[ 7]) ^ (in[ 7] ^ in[ 5])) ^ ((in[ 7] ^ in[ 5]) ^ (in[ 5] ^ in[ 3]));
			prbs11[ 7] = ((in[ 8] ^ in[ 6]) ^ (in[ 6] ^ in[ 4])) ^ ((in[ 6] ^ in[ 4]) ^ (in[ 4] ^ in[ 2]));
			prbs11[ 6] = ((in[ 7] ^ in[ 5]) ^ (in[ 5] ^ in[ 3])) ^ ((in[ 5] ^ in[ 3]) ^ (in[ 3] ^ in[ 1]));
			prbs11[ 5] = ((in[ 6] ^ in[ 4]) ^ (in[ 4] ^ in[ 2])) ^ ((in[ 4] ^ in[ 2]) ^ (in[ 2] ^ in[ 0]));
			prbs11[ 4] = ((in[ 5]^in[3])^(in[3]^in[1]))^((in[3]^ in[1])^(in[1]^(in[10]^in[8])));
			prbs11[ 3] = ((in[4]^in[2])^(in[2]^in[0]))^((in[2]^in[0])^(in[0]^(in[9]^in[7])));
			prbs11[ 2] = ((in[3]^in[1])^(in[1]^(in[10]^in[8])))^((in[1]^(in[10]^in[8]))^((in[10]^in[8])^(in[8]^in[6])));
			prbs11[ 1] = ((in[ 2]^in[0])^(in[0]^(in[9]^in[7])))^((in[0]^(in[9]^in[7]))^((in[9]^in[7])^(in[7]^in[5])));
			prbs11[ 0] = ((in[1]^(in[10]^in[8]))^((in[10]^in[8])^(in[8]^in[6])))^(((in[10]^in[8])^(in[8]^in[6]))^((in[8]^in[6])^(in[6]^in[4])));

      end
   endfunction

	/**************************************************/
	function [31:0] prbs15;
		input [31:0] in;
		begin
			prbs15[31] = in[14]^in[13];
			prbs15[30] = in[13]^in[12];
			prbs15[29] = in[12]^in[11];
			prbs15[28] = in[11]^in[10];
			prbs15[27] = in[10]^in[ 9];
			prbs15[26] = in[ 9]^in[ 8];
			prbs15[25] = in[ 8]^in[ 7];
			prbs15[24] = in[ 7]^in[ 6];
			prbs15[23] = in[ 6]^in[ 5];
			prbs15[22] = in[ 5]^in[ 4];
			prbs15[21] = in[ 4]^in[ 3];
			prbs15[20] = in[ 3]^in[ 2];
			prbs15[19] = in[ 2]^in[ 1];
			prbs15[18] = in[ 1]^in[ 0];
			prbs15[17] = in[ 0]^(in[14]^in[13]);
			prbs15[16] = (in[14] ^ in[13]) ^ (in[13] ^ in[12]);
			prbs15[15] = (in[13] ^ in[12]) ^ (in[12] ^ in[11]);
			prbs15[14] = (in[12] ^ in[11]) ^ (in[11] ^ in[10]);
			prbs15[13] = (in[11] ^ in[10]) ^ (in[10] ^ in[ 9]);
			prbs15[12] = (in[10] ^ in[ 9]) ^ (in[ 9] ^ in[ 8]);
			prbs15[11] = (in[ 9] ^ in[ 8]) ^ (in[ 8] ^ in[ 7]);
			prbs15[10] = (in[ 8] ^ in[ 7]) ^ (in[ 7] ^ in[ 6]);
			prbs15[ 9] = (in[ 7] ^ in[ 6]) ^ (in[ 6] ^ in[ 5]);
			prbs15[ 8] = (in[ 6] ^ in[ 5]) ^ (in[ 5] ^ in[ 4]);
			prbs15[ 7] = (in[ 5] ^ in[ 4]) ^ (in[ 4] ^ in[ 3]);
			prbs15[ 6] = (in[ 4] ^ in[ 3]) ^ (in[ 3] ^ in[ 2]);
			prbs15[ 5] = (in[ 3] ^ in[ 2]) ^ (in[ 2] ^ in[ 1]);
			prbs15[ 4] = (in[ 2] ^ in[ 1]) ^ (in[ 1] ^ in[ 0]);
			prbs15[ 3] = (in[ 1] ^ in[ 0]) ^ (in[ 0] ^ (in[14] ^ in[13]));
			prbs15[ 2] = (in[ 0] ^ (in[14] ^ in[13])) ^ ((in[14] ^ in[13]) ^ (in[13] ^ in[12]));
			prbs15[ 1] = ((in[14] ^ in[13]) ^ (in[13] ^ in[12])) ^ ((in[13] ^ in[12]) ^ (in[12] ^ in[11]));
			prbs15[ 0] = ((in[13] ^ in[12]) ^ (in[12] ^ in[11])) ^ ((in[12] ^ in[11]) ^ (in[11] ^ in[10]));
      end
   endfunction

	/**************************************************/
	function [31:0] prbs20;
		input [31:0] in;
		begin
			prbs20[31] = in[19] ^ in[16];
			prbs20[30] = in[18] ^ in[15];
			prbs20[29] = in[17] ^ in[14];
			prbs20[28] = in[16] ^ in[13];
			prbs20[27] = in[15] ^ in[12];
			prbs20[26] = in[14] ^ in[11];
			prbs20[25] = in[13] ^ in[10];
			prbs20[24] = in[12] ^ in[09];
			prbs20[23] = in[11] ^ in[08];
			prbs20[22] = in[10] ^ in[07];
			prbs20[21] = in[ 9] ^ in[06];
			prbs20[20] = in[ 8] ^ in[05];
			prbs20[19] = in[ 7] ^ in[04];
			prbs20[18] = in[ 6] ^ in[03];
			prbs20[17] = in[ 5] ^ in[02];
			prbs20[16] = in[ 4] ^ in[01];
			prbs20[15] = in[ 3] ^ in[0];
			prbs20[14] = in[ 2] ^ (in[19] ^ in[16]);
			prbs20[13] = in[ 1] ^ (in[18] ^ in[15]);
			prbs20[12] = in[ 0] ^ (in[17] ^ in[14]);
			prbs20[11] = (in[19] ^ in[16]) ^ (in[16] ^ in[13]);
			prbs20[10] = (in[18] ^ in[15]) ^ (in[15] ^ in[12]);
			prbs20[ 9] = (in[17] ^ in[14]) ^ (in[14] ^ in[11]);
			prbs20[ 8] = (in[16] ^ in[13]) ^ (in[13] ^ in[10]);
			prbs20[ 7] = (in[15] ^ in[12]) ^ (in[12] ^ in[09]);
			prbs20[ 6] = (in[14] ^ in[11]) ^ (in[11] ^ in[08]);
			prbs20[ 5] = (in[13] ^ in[10]) ^ (in[10] ^ in[07]);
			prbs20[ 4] = (in[12] ^ in[ 9]) ^ (in[ 9] ^ in[06]);
			prbs20[ 3] = (in[11] ^ in[ 8]) ^ (in[ 8] ^ in[05]);
			prbs20[ 2] = (in[10] ^ in[ 7]) ^ (in[ 7] ^ in[04]);
			prbs20[ 1] = (in[ 9] ^ in[ 6]) ^ (in[ 6] ^ in[03]);
			prbs20[ 0] = (in[ 8] ^ in[ 5]) ^ (in[ 5] ^ in[02]);
      end
   endfunction

	/**************************************************/
	function [31:0] prbs23;
		input [31:0] in;
		begin
			prbs23[31] = in[22] ^ in[17];
			prbs23[30] = in[21] ^ in[16];
			prbs23[29] = in[20] ^ in[15];
			prbs23[28] = in[19] ^ in[14];
			prbs23[27] = in[18] ^ in[13];
			prbs23[26] = in[17] ^ in[12];
			prbs23[25] = in[16] ^ in[11];
			prbs23[24] = in[15] ^ in[10];
			prbs23[23] = in[14] ^ in[ 9];
			prbs23[22] = in[13] ^ in[ 8];
			prbs23[21] = in[12] ^ in[ 7];
			prbs23[20] = in[11] ^ in[ 6];
			prbs23[19] = in[10] ^ in[ 5];
			prbs23[18] = in[ 9] ^ in[ 4];
			prbs23[17] = in[ 8] ^ in[ 3];
			prbs23[16] = in[ 7] ^ in[ 2];
			prbs23[15] = in[ 6] ^ in[ 1];
			prbs23[14] = in[ 5] ^ in[ 0];
			prbs23[13] = in[ 4] ^ (in[22] ^ in[17]);
			prbs23[12] = in[ 3] ^ (in[21] ^ in[16]);
			prbs23[11] = in[ 2] ^ (in[20] ^ in[15]);
			prbs23[10] = in[ 1] ^ (in[19] ^ in[14]);
			prbs23[ 9] = in[ 0] ^ (in[18] ^ in[13]);
			prbs23[ 8] = (in[22] ^ in[17]) ^ (in[17] ^ in[12]);
			prbs23[ 7] = (in[21] ^ in[16]) ^ (in[16] ^ in[11]);
			prbs23[ 6] = (in[20] ^ in[15])^ (in[15] ^ in[10]);
			prbs23[ 5] = (in[19] ^ in[14]) ^ (in[14] ^ in[ 9]);
			prbs23[ 4] = (in[18] ^ in[13]) ^ (in[13] ^ in[ 8]);
			prbs23[ 3] = (in[17] ^ in[12]) ^ (in[12] ^ in[ 7]);
			prbs23[ 2] = (in[16] ^ in[11]) ^ (in[11] ^ in[ 6]);
			prbs23[ 1] = (in[15] ^ in[10])^ (in[10] ^ in[ 5]);
			prbs23[ 0] = (in[14] ^ in[ 9])^ (in[ 9] ^ in[ 4]);
      end
   endfunction

	/**************************************************/
	function [31:0] prbs29;
		input [31:0] in;
		begin
			prbs29[31] = in[28] ^ in[26];
			prbs29[30] = in[27] ^ in[25];
			prbs29[29] = in[26] ^ in[24];
			prbs29[28] = in[25] ^ in[23];
			prbs29[27] = in[24] ^ in[22];
			prbs29[26] = in[23] ^ in[21];
			prbs29[25] = in[22] ^ in[20];
			prbs29[24] = in[21] ^ in[19];
			prbs29[23] = in[20] ^ in[18];
			prbs29[22] = in[19] ^ in[17];
			prbs29[21] = in[18] ^ in[16];
			prbs29[20] = in[17] ^ in[15];
			prbs29[19] = in[16] ^ in[14];
			prbs29[18] = in[15] ^ in[13];
			prbs29[17] = in[14] ^ in[12];
			prbs29[16] = in[13] ^ in[11];
			prbs29[15] = in[12] ^ in[10];
			prbs29[14] = in[11] ^ in[09];
			prbs29[13] = in[10] ^ in[08];
			prbs29[12] = in[09] ^ in[07];
			prbs29[11] = in[08] ^ in[06];
			prbs29[10] = in[07] ^ in[05];
			prbs29[ 9] = in[06] ^ in[04];
			prbs29[ 8] = in[05] ^ in[03];
			prbs29[ 7] = in[04] ^ in[02];
			prbs29[ 6] = in[03] ^ in[01];
			prbs29[ 5] = in[02] ^ in[00];
			prbs29[ 4] = in[01] ^ (in[28] ^ in[26]);
			prbs29[ 3] = in[00] ^ (in[27] ^ in[25]);
			prbs29[ 2] = (in[28] ^ in[26]) ^ (in[26] ^ in[24]);
			prbs29[ 1] = (in[27] ^ in[25]) ^ (in[25] ^ in[23]);
			prbs29[ 0] = (in[26] ^ in[24]) ^ (in[24] ^ in[22]);
      end
   endfunction

	/**************************************************/
	function [31:0] prbs31;
		input [31:0] in;
		begin
			prbs31[31] = in[30] ^ in[27];
			prbs31[30] = in[29] ^ in[26];
			prbs31[29] = in[28] ^ in[25];
			prbs31[28] = in[27] ^ in[24];
			prbs31[27] = in[26] ^ in[23];
			prbs31[26] = in[25] ^ in[22];
			prbs31[25] = in[24] ^ in[21];
			prbs31[24] = in[23] ^ in[20];
			prbs31[23] = in[22] ^ in[19];
			prbs31[22] = in[21] ^ in[18];
			prbs31[21] = in[20] ^ in[17];
			prbs31[20] = in[19] ^ in[16];
			prbs31[19] = in[18] ^ in[15];
			prbs31[18] = in[17] ^ in[14];
			prbs31[17] = in[16] ^ in[13];
			prbs31[16] = in[15] ^ in[12];
			prbs31[15] = in[14] ^ in[11];
			prbs31[14] = in[13] ^ in[10];
			prbs31[13] = in[12] ^ in[ 9];
			prbs31[12] = in[11] ^ in[ 8];
			prbs31[11] = in[10] ^ in[ 7];
			prbs31[10] = in[ 9] ^ in[ 6];
			prbs31[ 9] = in[ 8] ^ in[ 5];
			prbs31[ 8] = in[ 7] ^ in[ 4];
			prbs31[ 7] = in[ 6] ^ in[ 3];
			prbs31[ 6] = in[ 5] ^ in[ 2];
			prbs31[ 5] = in[ 4] ^ in[ 1];
			prbs31[ 4] = in[ 3] ^ in[ 0];
			prbs31[ 3] = in[ 2] ^ (in[30] ^ in[27]);
			prbs31[ 2] = in[ 1] ^ (in[29] ^ in[26]);
			prbs31[ 1] = in[ 0] ^ (in[28] ^ in[25]);
			prbs31[ 0] = (in[30] ^ in[27]) ^ (in[27] ^ in[24]);
      end
   endfunction

	//===================================================
	always @(posedge clock)begin
		if (init)begin
			case (type)
			TYPE_PRBS7 : out <= 32'hfe041851;
			TYPE_PRBS9 : out <= 32'hff83df17;
			TYPE_PRBS10: out <= 32'hffc070fd;
			TYPE_PRBS11: out <= 32'hffe00c07;
			TYPE_PRBS15: out <= 32'hfffe0004;
			TYPE_PRBS20: out <= 32'hfffff000;
			TYPE_PRBS23: out <= 32'hfffffe00;
			TYPE_PRBS29: out <= 32'hfffffff8;
			TYPE_PRBS31: out <= 32'hfffffffe;
			endcase
		end else begin
			case (type)
			TYPE_PRBS7 : out <= prbs7(out);
			TYPE_PRBS9 : out <= prbs9(out);
			TYPE_PRBS10: out <= prbs10(out);
			TYPE_PRBS11: out <= prbs11(out);
			TYPE_PRBS15: out <= prbs15(out);
			TYPE_PRBS20: out <= prbs20(out);
			TYPE_PRBS23: out <= prbs23(out);
			TYPE_PRBS29: out <= prbs29(out);
			TYPE_PRBS31: out <= prbs31(out);
			endcase

		end
	end

endmodule
