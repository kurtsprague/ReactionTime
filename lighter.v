module lighter(clk,enable, num, reset, outled);

input clk;
input [7:0] num;
input reset;
input enable;
output outled;

reg [7:0] i = 8'h00;


always@(posedge clk)
	begin
		if (enable) begin
			if(reset)begin
				i = 0;
				outled = 0;
			end
			else if( i < num) begin
				i = i+1;
			end
			else begin
				outled = 1;
			end
		end
	end
endmodule
