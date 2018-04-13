module BCDdecoder(binaryin,enable,sevenseg);
	input [3:0] binaryin;
	input enable;
	output reg [6:0] sevenseg;
	always @(binaryin) begin
		if(enable)
		begin
			casex(binaryin)
				4'b0000 : sevenseg = 7'b1000000; //0
				4'b0001 : sevenseg = 7'b1111001; //1
				4'b0010 : sevenseg = 7'b0100100;	//2
				4'b0011 : sevenseg = 7'b0110000;	//3
				4'b0100 : sevenseg = 7'b0011001;	//4
				4'b0101 : sevenseg = 7'b0010010;	//5
				4'b0110 : sevenseg = 7'b0000010;	//6
				4'b0111 : sevenseg = 7'b1111000;	//7
				4'b1000 : sevenseg = 7'b0000000;	//8
				4'b1001 : sevenseg = 7'b0010000;	//9
				4'b1010 : sevenseg = 7'bxxxxxxx;	//A
				4'b1011 : sevenseg = 7'bxxxxxxx;	//b
				4'b1100 : sevenseg = 7'bxxxxxxx;	//C
				4'b1101 : sevenseg = 7'bxxxxxxx;	//d
				4'b1110 : sevenseg = 7'bxxxxxxx; //E
				4'b1111 : sevenseg = 7'bxxxxxxx;	//f
			endcase
		end
		else
		begin
			sevenseg = 7'b1111111;
		end
	end
endmodule 