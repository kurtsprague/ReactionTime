module randominputsevenseg(lfsrin,out);
input [2:0] lfsrin;
output reg[13:0] out;
always@(lfsrin)
begin
	case(lfsrin)
		3'b000 : out = 14'b00100100110000;
		3'b001 : out = 14'b00100100011001;
		3'b010 : out = 14'b00100100010010;
		3'b011 : out = 14'b00100100000010;
		3'b100 : out = 14'b00100101111000;
		3'b101 : out = 14'b00100100000000;
		3'b110 : out = 14'b00100100010000;
		3'b111 : out = 14'b00000111111001;
	endcase
end
endmodule 


		