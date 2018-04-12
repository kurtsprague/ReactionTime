module LFSR(clk,res,out,en);
input clk;
input res;
input en;
output reg [7:0] out;

wire feed;

assign feed = !(out[7] ^ out[3]);

always@(posedge clk)
		out <= {out[6],out[5],out[4],out[3],out[2], out[1], out[0], feed};
	if (reset) begin
		out <= 8b'0;
		end
		else if (en) begin
		out <= {out[6],out[5],out[4],out[3],out[2], out[1], out[0], feed};
		end
		
endmodule
