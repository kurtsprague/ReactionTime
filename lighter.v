// ====================================
//   Ver  :| Authors					
//   V1.1 :| Andrew Zhu & Kurt Sprague
// ====================================

//module to light up the led when its time
//takes in a clock, an enable, a number to count up to
// outputs an led trigger signal, and an enable
module lighter(clk,enable, num, outled, enableout);

//input/output declaration
input clk;
input [7:0] num;
input enable;
output reg enableout;
output reg outled;

//reg to hold bits
reg [7:0] i = 8'h00;

//always at clock change
//if enable is high count to given number
//else trigger the output
always@(posedge clk)
	begin
		if (enable) begin
			if( i < num) begin
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
