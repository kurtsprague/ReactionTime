module clkdiv(clk,divtime, slowclk);
input clk;
input divtime;
output slowclk;

parameter pclk = divtime;
parameter i = 0;

always@(posedge clk)
begin 
		if(i < pclk)
			i = i +1;
		else begin
			i = 0;
			slowclk = slowclk^1;
		end
end

endmodule

