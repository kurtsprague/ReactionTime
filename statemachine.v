// ====================================
//   Ver  :| Authors					
//   V1.1 :| Andrew Zhu & Kurt Sprague
// ====================================

//module takes in the unchanged clock, reset, KEY[0], KEY[1]
//has an output, a trigger for the BCD to stop/start, a flag if the output is complete, and an enabler for the highscore mux
module statemachine(clock,reset,in,in1,highscore,out,BCDstop,outputcomplete,highscoreenable);
	input clock, reset, in, in1;
	input highscore;
	output reg out;
	output reg BCDstop; 
	output reg outputcomplete;
	output reg highscoreenable;
	reg [1:0] y, Y;
	//A is reset state, B is program is started, C is program stopped, D is high score
	parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	
	//always block triggered at the change of state or the 2buttons/switches
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

	//this always block is triggered off of the clock or reset button
	//moves the state along or resets state
	always@(posedge reset, posedge clock) begin
		if(reset == 1) 
			begin
			y <= A;
			end
		else
			y <= Y;
	end
endmodule
	