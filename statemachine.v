module statemachine(clock,reset,in,out);
	input clock, reset, in;
	output reg out;
	reg y, Y;
	//A is reset state, B is program is started
	parameter A = 1'b0, B = 1'b1;
	
	always@(in, y) begin
		case(y)
			A : if(in)
				 begin
					out = 0;
					Y = B;
				 end
				 else
				 begin
					out = 0;
					Y = A;
				 end
			B : out = 1;
		endcase
	end
	
	always@(posedge reset, posedge clock) begin
		if(reset == 1) 
			y <= A;
		else
			y <= Y;
	end
endmodule
	