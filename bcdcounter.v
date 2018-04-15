module BCDcounter(clk, enable, stop, count, ripplecarryout, BCDdecoderenable);

input clk;
input enable;
input stop;
output reg [3:0] count;
output reg ripplecarryout;
output reg BCDdecoderenable;

reg [3:0] d;


always@(posedge clk, posedge enable)
	begin
		if(enable)
		begin
			if(stop)
			begin
				count <= d;
				BCDdecoderenable <= 1; 
			end
			else if(d < 9)
			begin
				d <= d + 1;
				ripplecarryout <= 0;
			end
			else
			begin
				d <= 0;
				ripplecarryout <= 1;
			end
		end
		else
		begin
			ripplecarryout <= 0;
		end
	end
endmodule

