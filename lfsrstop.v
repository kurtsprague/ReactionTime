module lfsrstop(clk,stop,out);
input clk;
input stop;
output reg [2:0] out;

wire feed;
reg [2:0] buffout;

assign feed = !(buffout[2] ^ buffout[1]);


always@(posedge clk)
begin
	if (stop) begin
		out <= {buffout[2], buffout[1], buffout[0]};
		end
	else begin
			buffout <= {buffout[1], buffout[0], feed};
		end
end		
		
endmodule