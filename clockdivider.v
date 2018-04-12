module clkdiv(clk, slowclk);
input clk;
output reg slowclk;

parameter pclk = 500000;
integer i = 0;

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

