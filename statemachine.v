module statemachine(clock,reset,in,in1,out, BCDstop);
	input clock, reset, in, in1;
	output reg out;
	output reg BCDstop; 
	reg [1:0] y, Y;
	//A is reset state, B is program is started
	parameter A = 2'b00, B = 2'b01, C = 2'b10;
	
	always@(in,in1,y) begin
		case(y)
			A : if(in)
				 begin
					out = 0;
					BCDstop = 0;
					Y = B;
				 end
				 else
				 begin
					out = 0;
					BCDstop = 0;
					Y = A;
				 end
			B : if(in1)
				 begin
					out = 1;
					BCDstop = 0;
					Y = C;
				 end
				 else
				 begin
					out = 1;
					BCDstop = 0;
					Y = B;
				end
			C : BCDstop = 1;
		endcase
	end
	
	always@(posedge reset, posedge clock) begin
		if(reset == 1) 
			y <= A;
		else
			y <= Y;
	end
endmodule
	