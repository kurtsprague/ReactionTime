module gobuffs(clock,out);

input clock;
output[41:0] out;
reg[97:0] outbuf; 
reg[6:0] loopbuf;
initial begin
	/*outbuf[6:0] = 7'b0010010; //'5'
	outbuf[13:7] = 7'b0001110; //'f'
	outbuf[20:14] = 7'b0001110; //'f'
	outbuf[27:21] = 7'b1000001; //'U'
	outbuf[34:28] = 7'b0000011; //'b'
	outbuf[41:35] = 7'b1111111; //' '
	outbuf[48:42] = 7'b0100011; //'o'
	outbuf[55:49] = 7'b0000010; //'G'
	outbuf[97:56] = ~outbuf[97:56];*/
	outbuf = 98'b11111111111111111111111111111111111111111100000100100011111111100000111000001000111000011100010010;
end

assign out = outbuf[97:42];


always@(posedge clock)
begin
	loopbuf = outbuf[97:91];
	outbuf[97:7] = outbuf[90:0];
	outbuf[6:0] = loopbuf;
end

endmodule
