module LFSR(clk,stop,cenable,out);
input clk;
input stop;
output reg [7:0] out;
output reg cenable;

wire feed;
reg [7:0] buffout;

assign feed = !(buffout[7] ^ buffout[3]);


always@(posedge clk)
begin
	if (stop) begin
		out <= {buffout[7],buffout[6],buffout[5],buffout[4],buffout[3], buffout[2], buffout[1], buffout[0]};
		cenable <= 1;
		end
	else begin
			buffout <= {buffout[6],buffout[5],buffout[4],buffout[3],buffout[2], buffout[1], buffout[0], feed};
			cenable <= 0;
		end
end		
		
endmodule
