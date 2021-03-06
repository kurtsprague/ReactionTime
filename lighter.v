module lighter(clk,enable, num, outled);

input clk;
input [7:0] num;
input enable;
output reg outled;

reg [7:0] i = 8'h00;


always@(posedge clk)
	begin
		if (enable) begin
			if( i < num) begin
				i = i+1;
			end
			else begin
				outled = 1;
			end
		end
		else begin
			i = 0;
			outled = 0;
		end
	end
endmodule
