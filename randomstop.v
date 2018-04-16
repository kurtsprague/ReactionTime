module randomstopmux(sw3,sw4,sw5,sw6,sw7,sw8,sw9,b1,lfsrout,out);
input sw3, sw4, sw5, sw6, sw7, sw8, sw9, b1;
input [2:0] lfsrout;
output reg out;
always@(sw3, sw4, sw5, sw6, sw7, sw8, sw9, b1, lfsrout)
begin
	case(lfsrout)
		3'b000 : out = sw3;
		3'b001 : out = sw4;
		3'b010 : out = sw5;
		3'b011 : out = sw6;
		3'b100 : out = sw7;
		3'b101 : out = sw8;
		3'b110 : out = sw9;
		3'b111 : out = b1;
	endcase
end
endmodule
