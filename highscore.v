module highscore(dig0,dig1,dig2, score, storeddig0,storeddig1,storeddig2);
	input [3:0] dig0,dig1,dig2;
	input [11:0] score;
	output reg [3:0] storeddig0,storeddig1,storeddig2;
	
reg [11:0] storedscore;
	
always@(score)
	begin
		if (score < 12'b111111111111)
			begin
				storeddig0 = dig0;
				storeddig1 = dig1;
				storeddig2 = dig2;
				storedscore = score;
			end
		if (score < storedscore)
			begin
				storeddig0 = dig0;
				storeddig1 = dig1;
				storeddig2 = dig2;
				storedscore = score;
			end
	end

endmodule
