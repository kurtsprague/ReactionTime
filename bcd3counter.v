module bcd3counter(clock,clear,enable,BCD0,BCD1,BCD2);
	input clock, clear, enable; 
	output reg [3:0] BCD0, BCD1, BCD2;
	
	always@(posedge clock)
	begin
		if(clear)
		begin 
			BCD0 <= 0;
			BCD1 <= 0;
			BCD2 <= 0;
		end
		else if(enable)
		begin
			if((BCD0 == 4'b1001) && (BCD1 == 4'b1001))
			begin
				BCD0 <= 0;
				BCD1 <= 0;
				if(BCD2 == 4'b1001)
					BCD2 <= 0;
				else
					BCD2 <= BCD2 + 1;
			end
			else if(BCD0 == 4'b1001)
			begin
				BCD0 <= 0;
				BCD1 <= BCD1 + 1;
			end
			else
				BCD0 <= BCD0 + 1;
		end
	end
endmodule
					