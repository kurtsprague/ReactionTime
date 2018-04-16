module lighter(clk,enable, num, outled, enableout);

input clk;
input [6:0] num;
input enable;
output reg enableout;
output reg outled;

integer i = 0;


always@(posedge clk)
	begin
		if (enable) begin
			if( i < num*20) begin
				i = i+1;
			end
			else begin
				outled = 1;
				enableout = 0;
			end
		end
		else begin
			i = 0;
			outled = 0;
			enableout = 1;
		end
	end
endmodule
