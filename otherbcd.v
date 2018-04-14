module otherbcd(clk, enable, stop, count1, count2, count3, BCDdecoderenable);

input clk;
input enable;
input stop;
output reg [3:0] count1;
output reg [3:0] count2;
output reg [3:0] count3;
output reg [2:0] BCDdecoderenable;

reg [3:0] d1 = 0;
reg [3:0] d2 = 0;
reg [3:0] d3 = 0;



always@(posedge clk)
	begin
		if(enable)
			begin
			if(stop)
				begin
					count1 <= d1;
					count2 <= d2;
					count3 <= d3;
					BCDdecoderenable[2:0] <= 3'b111; 
				end
			if(d1 < 10)
				begin
					d1 <= d1 + 1;
					count1 <= d1;
					BCDdecoderenable[0] <= 1;
				end
			if(d1 == 10)
				begin
					d2 = d2 + 1;
					BCDdecoderenable[1] <= 1;
					d1 <= 0;
					count2 <= d2;
				end
			if(d2 == 10)
				begin
				   d2 <= 4'b0000;
					d3 <= d3 + 1;
					BCDdecoderenable[2] <= 1;
					count3 <= d3;
				end
			end
		else
			begin
				d1 <= 0;
				d2 <= 0;
				d3 <= 0;
				count1 <= 0;
				count2 <= 0;
				count3 <= 0;
				
			end
	end
endmodule

