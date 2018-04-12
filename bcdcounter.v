module BCDcounter(clk, reset, d);

input clk;
input reset;
output [3:0] d;

reg [3:0] d;


always@(posedge clk)
	begin
		if(reset)
			d <= 0;
		else if(d <= 9)
			begin
				d <= d + 1;
			end
		else if (d == 9)
			begin
				d <= 0;
			end
		end
endmodule

