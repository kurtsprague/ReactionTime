module statemachine(clock,reset,in,in1,highscore,out,BCDstop,outputcomplete,highscoreenable);
	input clock, reset, in, in1;
	input highscore;
	output reg out;
	output reg BCDstop; 
	output reg outputcomplete;
	output reg highscoreenable;
	reg [1:0] y, Y;
	//A is reset state, B is program is started
	parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	
	always@(in, in1, highscore, y) begin
		case(y)
			A : if(in)
				 begin
					out = 0;
					BCDstop = 0;
					outputcomplete = 0;
					highscoreenable = 0;
					Y = B;
				 end
				 else if(highscore)
				 begin
					out = 0;
					BCDstop = 0;
					outputcomplete = 0;
					highscoreenable = 0;
					Y = D;
					end
				 else
				 begin
					out = 0;
					BCDstop = 0;
					outputcomplete = 0;
					highscoreenable = 0;
					Y = A;
				 end
			B : if(in1)
				 begin
					out = 1;
					BCDstop = 1;
					Y = C;
				 end
				 else
				 begin
					out = 1;
					BCDstop = 1;
					Y = B;
				end
			C : begin
				BCDstop = 0;
				out = 1;
				Y = C;
				outputcomplete = 1;
				end
			D: begin
				BCDstop = 0;
				out = 0;
				outputcomplete = 0;
				highscoreenable = 1;
				Y = D;
				end
		endcase
	end
	
	always@(posedge reset, posedge clock) begin
		if(reset == 1) 
			begin
			y <= A;
			end
		else
			y <= Y;
	end
endmodule
	