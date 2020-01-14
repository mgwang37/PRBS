module crc32_d8(crc, data, nextcrc32_d8);
input  [7:0] 	 data;
input  [31:0] 	 crc;
output [31:0] 	 nextcrc32_d8;
wire	 [31:0]	 nextcrc32_d8;
wire	 [31:0]	 newcrc;

assign	newcrc[0]  = data[6] ^ data[0] ^ crc[24] ^ crc[30];

assign	newcrc[1]  = data[7] ^ data[6] ^ data[1] ^ data[0] ^ crc[24] ^ crc[25] ^ crc[30] ^ crc[31];
		    
assign	newcrc[2]  = data[7] ^ data[6] ^ data[2] ^ data[1] ^ data[0] ^ crc[24] ^ crc[25] ^ crc[26] ^ crc[30] ^ crc[31];
		    
assign	newcrc[3]  = data[7] ^ data[3] ^ data[2] ^ data[1] ^ crc[25] ^ crc[26] ^ crc[27] ^ crc[31];
		    
assign	newcrc[4]  = data[6] ^ data[4] ^ data[3] ^ data[2] ^ data[0] ^ crc[24] ^ crc[26] ^ crc[27] ^ crc[28] ^ crc[30];
		    
assign	newcrc[5]  = data[7] ^ data[6] ^ data[5] ^ data[4] ^ data[3] ^ data[1] ^ data[0] ^ crc[24] ^ crc[25] ^ crc[27] ^ crc[28] ^ crc[29] ^ crc[30] ^ crc[31];
		    
assign	newcrc[6]  = data[7] ^ data[6] ^ data[5] ^ data[4] ^ data[2] ^ data[1] ^ crc[25] ^ crc[26] ^ crc[28] ^ crc[29] ^ crc[30] ^ crc[31];
		    
assign	newcrc[7]  = data[7] ^ data[5] ^ data[3] ^ data[2] ^ data[0] ^ crc[24] ^ crc[26] ^ crc[27] ^ crc[29] ^ crc[31];
		    
assign 	newcrc[8]  = data[4] ^ data[3] ^ data[1] ^ data[0] ^ crc[0]  ^ crc[24] ^ crc[25] ^ crc[27] ^ crc[28];
		    
assign 	newcrc[9]  = data[5] ^ data[4] ^ data[2] ^ data[1] ^ crc[1]  ^ crc[25] ^ crc[26] ^ crc[28] ^ crc[29];
		    
assign	newcrc[10] = data[5] ^ data[3] ^ data[2] ^ data[0] ^ crc[2]  ^ crc[24] ^ crc[26] ^ crc[27] ^ crc[29];
		     
assign	newcrc[11] = data[4] ^ data[3] ^ data[1] ^ data[0] ^ crc[3]  ^ crc[24] ^ crc[25] ^ crc[27] ^ crc[28];
		     
assign	newcrc[12] = data[6] ^ data[5] ^ data[4] ^ data[2] ^ data[1] ^ data[0] ^ crc[4]  ^ crc[24] ^ crc[25] ^ crc[26] ^ crc[28] ^ crc[29] ^ crc[30] ;
		     
assign	newcrc[13] = data[7] ^ data[6] ^ data[5] ^ data[3] ^ data[2] ^ data[1] ^ crc[5]  ^ crc[25] ^ crc[26] ^ crc[27] ^ crc[29] ^ crc[30] ^ crc[31] ;
		     
assign	newcrc[14] = data[7] ^ data[6] ^ data[4] ^ data[3] ^ data[2] ^ crc[6]  ^ crc[26] ^ crc[27] ^ crc[28] ^ crc[30] ^ crc[31] ;
		     
assign	newcrc[15] = data[7] ^ data[5] ^ data[4] ^ data[3] ^ crc[7]  ^ crc[27] ^ crc[28] ^ crc[29] ^ crc[31];
		     
assign	newcrc[16] = data[5] ^ data[4] ^ data[0] ^ crc[8]  ^ crc[24] ^ crc[28] ^ crc[29];

assign	newcrc[17] = data[6] ^ data[5] ^ data[1] ^ crc[9]  ^ crc[25] ^ crc[29] ^ crc[30];

assign	newcrc[18] = data[7] ^ data[6] ^ data[2] ^ crc[10] ^ crc[26] ^ crc[30] ^ crc[31];

assign	newcrc[19] = data[7] ^ data[3] ^ crc[11] ^ crc[27] ^ crc[31];

assign	newcrc[20] = data[4] ^ crc[12] ^ crc[28];

assign	newcrc[21] = data[5] ^ crc[13] ^ crc[29];

assign	newcrc[22] = data[0] ^ crc[14] ^ crc[24];

assign	newcrc[23] = data[6] ^ data[1] ^ data[0] ^ crc[15] ^ crc[24] ^ crc[25] ^ crc[30];

assign	newcrc[24] = data[7] ^ data[2] ^ data[1] ^ crc[16] ^ crc[25] ^ crc[26] ^ crc[31];

assign	newcrc[25] = data[3] ^ data[2] ^ crc[17] ^ crc[26] ^ crc[27];

assign	newcrc[26] = data[6] ^ data[4] ^ data[3] ^ data[0] ^ crc[18] ^ crc[24] ^ crc[27] ^ crc[28] ^ crc[30] ;
		     
assign	newcrc[27] = data[7] ^ data[5] ^ data[4] ^ data[1] ^ crc[19] ^ crc[25] ^ crc[28] ^ crc[29] ^ crc[31];
		     
assign	newcrc[28] = data[6] ^ data[5] ^ data[2] ^ crc[20] ^ crc[26] ^ crc[29] ^ crc[30];

assign	newcrc[29] = data[7] ^ data[6] ^ data[3] ^ crc[21] ^ crc[27] ^ crc[30] ^ crc[31];

assign	newcrc[30] = data[7] ^ data[4] ^ crc[22] ^ crc[28] ^ crc[31];

assign	newcrc[31] = data[5] ^ crc[23] ^ crc[29];

assign	nextcrc32_d8 = newcrc;

endmodule


