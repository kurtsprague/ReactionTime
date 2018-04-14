module BCDcounter(clk, enable, stop, count, ripplecarryout, BCDdecoderenable);

input clk;
input enable;
input stop;
output reg [3:0] count;
output reg ripplecarryout;
output reg BCDdecoderenable;

reg [3:0] d = 4'b0000;



always@(posedge clk)
	begin
		if(enable)
			begin
			if(stop)
				begin
					count <= d;
					BCDdecoderenable <= 1; 
				end
			else if(d < 4'b1001)
				begin
					d <= d + 1;
					count <= d;
					ripplecarryout <= 0;
				end
			else if(d == 4'b1001)
				begin
					ripplecarryout <= 1;
					d <= 4'b0000;
					count <= d;
				end
			end
		else
			begin
				d <= 0;
				count <= 0;
				ripplecarryout <= 0;
				BCDdecoderenable <= 1;
			end
	end
endmodule

