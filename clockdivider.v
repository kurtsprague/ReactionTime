// ====================================
//   Ver  :| Authors					
//   V1.1 :| Andrew Zhu & Kurt Sprague
// ====================================

//module for "slowing" down clock using parameter and always@
module clkdiv(clk, slowclk);
input clk;
output reg slowclk;

parameter pclk = 25000;
integer i = 0;

// the clock will be delayed by parameter size, interchangable
// the delayed clock sends a pulse for every x pulses (defined by parameter)
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

